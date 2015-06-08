# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Bjorn Arild Maeland <bjorn.maeland at gmail dot com>

pkgname=aspell-nn
pkgver=0.50.1
pkgrel=2
pkgdesc="Norwegian Nynorsk dictionary for aspell"
url="http://aspell.net/"
license="GPL"
depends=('aspell')
arch=('any')
source=(ftp://ftp.gnu.org/gnu/aspell/dict/nn/${pkgname}-${pkgver}-1.tar.bz2)
md5sums=('3711eb9df68f25262af10119579239bc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-1"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-1"
  make DESTDIR="$pkgdir" install
}
