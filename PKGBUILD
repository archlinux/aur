# Maintainer: rnestler

pkgname=git-meld-index
pkgver=0.2.9
pkgrel=1
pkgdesc="Run meld or any git difftool to interactively stage changes"
arch=('any')
url="https://github.com/jjlee/git-meld-index"
license=('GPL-2.0-only')
depends=('python>=3.9.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jjlee/$pkgname/archive/$pkgver.tar.gz")

sha512sums=('82b265525aa2ad7ce29ba7e85acf2a31a92da2b2dc85c7bc660c85ec2d1a2e561fb678ec942eaad4f21b3d0e8fbed343a685b9b527bfac87a6213c7bc0e1e4ea')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
