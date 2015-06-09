# Maintainer: TingPing <tingping@tingping.se>

pkgname=hexchat-javascript-git
pkgver=0.3.2.2.gb93950a
pkgrel=1
pkgdesc='HexChat plugin for Javascript scripts'
arch=('i686' 'x86_64')
url='https://github.com/TingPing/hexchat-javascript'
license=('MPL')
depends=('js185' 'hexchat')
makedepends=('git')
optdepends=()
options=()
install=
source=('git://github.com/TingPing/hexchat-javascript.git')
md5sums=('SKIP')
_gitname='hexchat-javascript'

pkgver() {
  cd "$_gitname"
  echo `git describe --tags --long | sed 's/-/./g'`
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -m644 -D javascript.so "$pkgdir/usr/lib/hexchat/plugins/javascript.so"
}

