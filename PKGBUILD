# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Maintainer: Kewl <echo kewl@blto.eu.org | tr b a>

pkgname=simplenote-electron-bin
_pkgname=simplenote
pkgver=1.1.2
pkgrel=1
pkgdesc="The simplest way to keep notes."
arch=('x86_64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('gcc-libs' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2')
optdepends=()
provides=('simplenote')
source=("https://github.com/Automattic/simplenote-electron/releases/download/v${pkgver}/Simplenote-linux-${pkgver}.deb")
sha256sums=('461ef7e6eea617d6e33818b59a0235d1f09ff6dab57c24810acf261ecbe244ec')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.gz"

  mkdir -p ${pkgdir}/usr/bin/
  ln -s /usr/share/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
