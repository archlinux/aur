# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pipname=dbfread
pkgname=python-$_pipname
pkgver=2.0.7
pkgrel=1
pkgdesc='Read DBF Files with Python'
arch=('any')
url='https://dbfread.readthedocs.io'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/olemb/$_pipname/archive/$pkgver.tar.gz")
sha256sums=('7772db69a32beb87027356cb04dd7775bbc2e36581e76df6ba33c0eb8d1c49ad')

build() {
	cd "$_pipname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pipname-$pkgver"
  python setup.py test
}

package() {
  cd "$_pipname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
