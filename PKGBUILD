# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: sh0 <mee@sh0.org>
pkgname=space_dapp
pkgver=0.0.1
pkgrel=4
pkgdesc="A spacer dockapp"
url="http://tenr.de/howto/space_dapp/space_dapp.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp')
source=(http://darkshed.net/files/c_cpp/bits/$pkgname.c)
md5sums=('187b12a1f68fcfe13442d9a65261230d')

build() {
  cd $srcdir
  gcc -o space_dapp space_dapp.c -DSHAPE -I/usr/include/X11/ -lX11 -lXext
}
package() {
  cd $srcdir
  install -D -m755 space_dapp $pkgdir/usr/bin/space_dapp
}
