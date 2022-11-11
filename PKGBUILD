# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
_pkgname=quickgui
pkgname=$_pkgname-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=('x86_64')
url="https://github.com/quickgui/quickgui"
license=('GPL')
depends=('quickemu' 'zenity')
options=('!strip' '!emptydirs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}_$pkgver-1_kinetic1.0_amd64.deb"::"https://github.com/quickemu-project/$_pkgname/releases/download/v$pkgver/${_pkgname}_$pkgver-1_kinetic1.0_amd64.deb")
sha256sums=('68ae39a5fca566af36c57404fc7b3edc82795bfdcb69f23ef1f2f0b66b5570f5')

package() {
  tar -xf data.tar.zst -C "$pkgdir"
  install -D -m644 "${pkgdir}/usr/share/doc/quickgui/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
