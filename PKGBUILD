# Maintainer: Oliver Friedrich <olifriedrich@gmail.com>

pkgname=noise-repellent
pkgver=0.1.3f
pkgrel=1
pkgdesc="An lv2 plugin for broadband noise reduction."
arch=('i686' 'x86_64')
url="https://github.com/lucianodato/noise-repellent"
license=('GPL')
groups=('lv2-plugins')
depends=('fftw' 'lv2')
makedepends=('gcc')
optdepends=('jack: standalone jack client'
            'ardour: intended use')
source=("https://github.com/lucianodato/noise-repellent/archive/$pkgver.tar.gz")
md5sums=('c09f63f04bcb2d74590cdcf332f87799')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
