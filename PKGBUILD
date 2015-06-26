# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=turboparser
pkgver=2.2.0
pkgrel=1
pkgdesc="Dependency parser with linear programming"
arch=(x86_64)
url="http://www.ark.cs.cmu.edu/TurboParser/"
license=('LGPL')
depends=(eigen ad3 google-glog google-gflags)
options=()
source=(http://www.cs.cmu.edu/~afm/TurboParser/TurboParser-${pkgver}.tar.gz)
md5sums=('bb5f877c0d80ec6b962f6bd138f2f5ea')

build() {
	cd "$srcdir/TurboParser-$pkgver"
    ./configure CXXFLAGS="-I/usr/include/ad3 -I/usr/include/eigen3" --prefix=/usr
	make
}

package() {
	cd "$srcdir/TurboParser-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" TurboParser TurboTagger TurboSemanticParser
}
