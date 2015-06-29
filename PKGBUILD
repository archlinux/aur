# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pdftxt
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="A simple wrapper around mupdf library to extract text from pdf files."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir"
license=('custom:BSD')
groups=()
depends=('mupdf')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=pdftxt.install
changelog=
source=("http://litcave.rudi.ir/${pkgname}-${pkgver}.tar.gz"
        'mupdfgrep'
        'LICENSE')
noextract=()
options=()
md5sums=('cd5e15673c0065152e6bc781e59f405d'
         '95ccf38e8ab9ae076b9ad45d27ab0899'
         'ec67f29a7dec10f86ef31515ed657a91')
sha1sums=('c1b4f2b5ae0aaf7162a30fd70ad2b4fda38b4ad1'
          '30b7ed6cef089d9777c90108138c91526ff60d8d'
          '76a535243054e1fdd9caaa46a1571cd381d74353')
sha256sums=('544c414b03f9005febbf4cd6d32aa8349eb78c0e905c1625cbe430ae5ff01903'
            'f4ec1ef6838f9e8e77d5710c108dceec1fb4b256bc548615e1670b90d9e53eec'
            '0ea8d51c57a3a59ca57428b6fe9b47fdb1fde281fc1b095c9832872e85b09a72')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/lopenjpeg/lopenjp2/' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 pdftxt "$pkgdir/usr/bin/pdftxt"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 ../mupdfgrep "$pkgdir/usr/bin/mupdfgrep"
}

