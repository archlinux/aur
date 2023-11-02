# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-webdataset'
_name=${pkgname#python-}
pkgver='0.2.73'
pkgrel=1
pkgdesc="Record sequential storage for deep learning."
url="https://github.com/webdataset/webdataset"
depends=('python-msgpack' 'python-pillow' 'python-pytorch' 'python-simplejson' 'python-six' 'python-torchvision' 'python-pyzmq')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('dc73c81326eff7e8060903d637d10c8c5ca9955e72b2fc240dd0cceb8c2e9f47')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
