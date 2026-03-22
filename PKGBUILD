# Maintainer: dem4ply <dem4ply@gmail.com>

pkgname=python-chibi-sshd
_pyname=chibi_sshd
pkgver=1.0.0
pkgrel=1
pkgdesc="package for handling config files of ssh like sshd_config and authorized_keys"
arch=('any')
url="https://pypi.org/project/chibi-sshd/"
license=('WTFPL')
groups=()
depends=("python" "python-chibi" "python-chibi-atlas" "python-chibi-hybrid" )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('51f6bf245e4eead20ab433e9857a06309ea11030ccd170bb5c65604ccae66f32')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
