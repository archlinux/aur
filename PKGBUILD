# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=wpunix
pkgname="${_pkgname}-bin"
pkgver=0.13
pkgrel=1
pkgdesc='WordPerfect for UNIX Character Terminals'
arch=('x86_64')
url='https://github.com/taviso/wpunix'
license=('unknown')
depends=('lib32-ncurses')
makedepends=('rpmextract')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("https://github.com/taviso/wpunix/releases/download/v${pkgver}/wordperfect8-${pkgver}-1.fc37.i686.rpm")
sha512sums=('0c9e86b258ba79a547539ba12a069e2953aa56b50de99958214aacddc12a637fed4b9b0e2f51ee874a1b4c16df3dcc3eadad007b998579b106fd27e428dea5d2')

prepare() {
  rpmextract.sh wordperfect8-${pkgver}-1.fc37.i686.rpm
}

package() {
  cp -r opt "$pkgdir"
  cp -r usr "$pkgdir"
}
