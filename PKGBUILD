# Maintainer: NicoHood <aur {at} nicohood {dot} de>

pkgname=ipod-shuffle-4g
pkgver=1.3
pkgrel=1
pkgdesc="Python script for building the track and playlist database for the newer gen IPod Shuffle"
arch=('any')
url="https://github.com/nims11/${_pkgname}"
license=('GPL2')
depends=('python' 'mutagen')
optdepends=('espeak: Voiceover support')
source=("https://github.com/nims11/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2584dadecbaa751d0b62c38823b7962daab02b7e429ec6cc6869d8e1427908ca')

package() {
  cd "IPod-Shuffle-4g-${pkgver}"

  # Install main script
  install -Dm755 "shuffle.py" "${pkgdir}/usr/bin/${pkgname}"

  # Add documentation
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" docs/*.md *.md
}
