# Maintainer: Alexandru Lazar <alexandru97.lazar@gmail.com>

pkgname=python-ipyida
_pkgname=ipyida
pkgver=2.0
pkgrel=1
pkgdesc="IPyIDA is a python-only solution to add an IPython console to IDA Pro."
arch=('any')
url="https://www.github.com/eset/ipyida"
license=('BSD')
depends=('python' 'python-ipykernel' 'python-qtconsole' 'python-qasync' 'jupyter-nbformat')
checkdepends=()
optdepends=()
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('47cd6aec9fdd9333b0a4a582683d6e35409bfe26456fec7398c9b8bb2cad651e')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
