# Maintainer: Feakster <feakster at posteo dot eu>
# Contributor: Hugo Sales <hugo (at) fc (dot) up (dot) pt>

### Notes ###
# - https://www.mrc-bsu.cam.ac.uk/software/bugs/openbugs/building-and-packaging-openbugs/openbugs-linux-installation/

### Info ###
pkgname=openbugs
_pkgname=OpenBUGS
pkgver=3.2.3
pkgrel=3
pkgdesc='OpenBUGS, a software package for performing Bayesian inference Using Gibbs Sampling'
arch=('x86_64' 'i686' 'pentium4')
url='https://www.mrc-bsu.cam.ac.uk/software/bugs/openbugs/'
license=('GPL3')
depends=('lib32-gcc-libs')
makedepends=('automake' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://www.mrc-bsu.cam.ac.uk/wp-content/uploads/2018/04/$_pkgname-$pkgver.tar.gz")
b2sums=('3ee14aae726a80c7105b4b069f0e598144d9680a0c3e6f0884d0630b0923419e03b23d14c287bc63f960cb17449f2f15817303901932815249a798d11edeae77')

### Prepare ###
prepare() {
    cd "$srcdir"/$_pkgname-$pkgver
    ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
}

### Build ###
build() {
    cd "$srcdir"/$_pkgname-$pkgver
    make
}

### Package ###
package() {
    cd "$srcdir"/$_pkgname-$pkgver
    make install DESTDIR="$pkgdir"
    ln -fs /usr/bin/$_pkgname "$pkgdir"/usr/bin/$pkgname
}
