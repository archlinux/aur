# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=pdh
pkgver=0.2.2
pkgrel=1
pkgdesc="Pagerduty CLI for humans "
arch=('any')
url="https://github.com/mbovo/pdh"
license=('APACHE')
depends=('python-click' 'python-colorama' 'python-rich' 'python-pyaml' 'python-textual' 'python-pdpyras')
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cf893f52dd0162c31b36e063a8004d8b4c5f8397555ce9a712edff3958e0e665')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py build
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
