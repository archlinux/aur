# Contributor: noonov <noonov@gmail.com>

pkgname=xyzsh
pkgver=1.5.8
pkgrel=2
pkgdesc="Interactive shell and text processing tools"
arch=('i686' 'x86_64')
url="https://github.com/ab25cq/xyzsh"
license=('MIT')
depends=('oniguruma' 'gc')
source=(http://dl.sourceforge.jp/xyzsh/60140/${pkgname}-${pkgver}.tgz)
md5sums=('4fab43dbd794fb4af871ac6c9989526b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --with-optimize
  make -j1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make -j1 DESTDIR=${pkgdir} install
  install --mode=644 -D --no-target-directory $srcdir/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/$pkgname/LICENSE

}

