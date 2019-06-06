# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-pywsd
_pkgname=pywsd
pkgver=1.2.1
pkgrel=1
pkgdesc='Python Implementations of Word Sense Disambiguation (WSD) technologies'
arch=('any')
url='https://github.com/alvations/pywsd'
license=('MIT')
depends=('python' 'python-nltk' 'python-pandas' 'python-numpy' 'python-wn' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/8c/79/39597ff5510a63f44c9d4ce2f6a8200bbb1ae9c7b50ef90fe1f851f2c10d/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2b24c990e6ff65623ceafda20bfd9de35af90501080292e796b13247fd0ec405')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

