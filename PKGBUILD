#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=etelemetry
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="Etelemetry python client API"
url="https://github.com/RDFLib/rdflib/pull/649"
arch=('any')
license=('apache')
depends=('python')
provides=("python-etelemetry")
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/b1/89/a8a87c4a65f5f922a3e8ef298c1ba6979f923ff144a6f3203c14e04a6537/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('32147fe3cb770dea9a6aa7057942faa0ff57b131c3dfcba3ac93ad3ef4c66d54')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

