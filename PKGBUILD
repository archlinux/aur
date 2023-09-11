# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>
# Contributor: Rob Knegjens <rknegjens@gmail.com>

pkgname=qcl
pkgver='0.6.7'
pkgrel=1
pkgdesc='Quantum Computation Language'
arch=('i686' 'x86_64')
url='http://tph.tuwien.ac.at/~oemer/qcl.html'
license=('GPL2')
changelog='CHANGELOG.txt'
makedepends=('flex' 'bison')
depends=('readline' 'plotutils')
source=("http://tph.tuwien.ac.at/~oemer/tgz/$pkgname-$pkgver.tgz"
        'makefile.patch'
        'CHANGELOG.txt')
b2sums=('b4d345f06a3988652ffed71ce0133247ef07a8149a4b7c4719424b020274f095432b82d3edea85a0acbd0f185f9c3211614714dea09f5cc2e3df59ae81dd8b0d'
        'eaf473703c7d985aa5d8b4c47c563a4067f2f895a1e79414b3591c98e988d79617ee49eaee2ae1bd701ecc40a8a7d9d0e1995b9fb2e889433b028f6a87ba9b60'
        '6e2e7733725a80c58d5c3b39ac3e11d7bc3e4e6a1df1b02e1a32cf912f04218eda918f0fb20cf99ad46cb42593abff683392cebaa8d7e2a12a12843928a09d54')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/makefile.patch"
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
