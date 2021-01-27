# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-pywsd
_pkgname=pywsd
pkgver=1.2.4
pkgrel=1
pkgdesc='Python Implementations of Word Sense Disambiguation (WSD) technologies'
arch=('any')
url='https://github.com/alvations/pywsd'
license=('MIT')
depends=('python' 'python-nltk' 'python-pandas' 'python-numpy' 'python-wn' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/9d/bb/427a49c461b0970c124509f77d2cd75bdca0daa746155c45d065f0af93e3/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c15fa8096d30fa965d386fa883398ec4bf87be7f8bd5fd34cac3433ad5ba411d')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

