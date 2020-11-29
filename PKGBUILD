pkgname=apio
_name=apio
pkgver=0.6.0
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL')
depends=('python-click' 'python-pyserial' 'python-semantic-version'
         'python-pyjwt' 'python-colorama' 'python-requests' 'sudo' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cf1b350d685b2fe10fcd148f29144cc984a301396b642ddd883c1630ace22eed')

build() {
  cd "$pkgname-$pkgver"

  sed -i 's/click>=5,<7/click>=5,<8/g' ./setup.py
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"/  --optimize=1
}
