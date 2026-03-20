# Maintainer: dem4ply <dem4ply@gmail.com>

pkgname=python-chibi-fstab
_pyname=chibi_fstab
pkgver=1.0.0
pkgrel=1
pkgdesc="small lib for read and write fstab files"
arch=('any')
url="https://pypi.org/project/chibi_fstab/"
license=('WTFPL')
groups=()
depends=("python" "python-chibi" "python-chibi-atlas" "python-chibi-hybrid" )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('3a1013c5bdbe0495f936318c3bcc284b8113f4e7f3a59ed22efdcb2ae184f846')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
