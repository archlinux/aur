# Maintainer: Amish <contact at via dot aur>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=dwdiff
pkgver=2.1.4
pkgrel=6
pkgdesc='A diff program that operates at the word level instead of the line level'
arch=('x86_64')
url='https://os.ghalkes.nl/dwdiff.html'
depends=('diffutils' 'icu')
license=('GPL')
source=("https://os.ghalkes.nl/dist/$pkgname-$pkgver.tar.bz2")
sha256sums=('df16fec44dcb467d65a4246a43628f93741996c1773e930b90c6dde22dd58e0a')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --without-dwfilter
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix="$pkgdir"/usr install
}
