# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.5.1
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/mintsuki/jinx"
license=("BSD")
depends=('sh' 'curl' 'findutils' 'awk' 'gcc' 'git' 'grep' 'gzip' 'procps' 'tar' 'xz')
source=("git+https://codeberg.org/mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('9f7ea3efa153a429f9a0a727217db6bd793b6cb559e6c381bbf3d57f72b76a81770440ab3c0d3caefb6e33e0286860b0ec3646749be27dd063012bb85eaa55dd')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
