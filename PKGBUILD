pkgname=apio
_name=apio
pkgver=0.4.1
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL')
depends=('python-click' 'python-pyserial' 'python-semantic-version'
         'python-pyjwt' 'python-colorama' 'python-requests' 'sudo' 'python-urllib3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('b268ab128c961adeeacbda0dbc5d6947')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"/  --optimize=1
}
