# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=auto-auto-complete
pkgver=7.1
pkgrel=1
pkgdesc='Autogenerate shell auto-completion scripts'
arch=('any')
url='https://github.com/maandree/auto-auto-complete'
license=('GPL3')
depends=('python3')
makedepends=('make' 'sed' 'coreutils' 'python3' 'texinfo')
install=auto-auto-complete.install
source=(https://github.com/maandree/auto-auto-complete/archive/$pkgver.tar.gz)
sha256sums=(02639d1031c28529d247765587fdbb7afd6bed3a75381eae4846c747555cf24e)


build() {
  cd "auto-auto-complete-${pkgver}"
  make
}

package() {
  cd "auto-auto-complete-${pkgver}"
  make DESTDIR="$pkgdir" install
}

