# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-willow'
_name=Willow
pkgver='1.4.1'
pkgrel=1
pkgdesc="A Python image library that sits on top of Pillow, Wand and OpenCV"
url="https://www.sphinx-needs.com/"
depends=('python-numpy' 'python-pillow')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0df8ff528531e00b48d40bf72ed81beac1dc82f2d42e5bbed4aff0218bef8c0d')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
