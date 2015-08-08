# Maintainer: Tavian Barnes <tavianator@tavianator.com>
# Contributor: ngukho <ngukho at gmail dot com>
pkgname=liblbfgs
pkgver=1.10
pkgrel=1
pkgdesc="A C port of the implementation of Limited-memory Broyden-Fletcher-Goldfarb-Shanno (L-BFGS) method written by Jorge Nocedal."
arch=('i686' 'x86_64')
url="http://www.chokkan.org/software/liblbfgs/"
license=('custom:MIT')
source=("https://github.com/downloads/chokkan/liblbfgs/$pkgname-$pkgver.tar.gz")
md5sums=('2a46da6c4014d6b1e8a8790a93edffbb') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/liblbfgs/COPYING
}

# vim:set ts=2 sw=2 et:
