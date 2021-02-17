# Contributor: slubman <packages@slubman.info>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname=qrfcview
pkgver=0.62
pkgrel=6
pkgdesc="A simple Qt4 RFC viewer"
license=('GPL')
arch=(i686 x86_64)
url="https://sourceforge.net/projects/qrfcview.berlios/"
depends=('qt4')
source=(https://sourceforge.net/projects/qrfcview.berlios/files/$pkgname-$pkgver.tgz compile.patch)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../compile.patch
  qmake-qt4 -unix rfcview.pro || return 1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 bin/qRFCView "$pkgdir/usr/bin/"
}

md5sums=('836783d9c327237f4b1aa40de6b4376a'
         'd35b267500ccbd173fd64b847413c4f8')
sha256sums=('59a01a8cada0c9d9a4d577181b80b7e9750ff9a9d4a9826cefca30bdc7365830'
            '5e7b11259b291dd28d6cd2757ad232a739e4d76d8c7edab305e63e38b99189f1')
