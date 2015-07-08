# Maintainer: Isaac Dupree <antispam@idupree.com>

pkgname=libsass
pkgver=3.2.5
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library)."
arch=('i686' 'x86_64')
url="http://libsass.org/"
license=('MIT')
source=(https://github.com/sass/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('44c7f493b471317f8dc126fd316b8895c6ab24827f9df56fd3df071dae9945f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
