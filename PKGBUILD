_pipname=yamk
pkgname="python-${_pipname}"
pkgver=0.16.0
pkgrel=1
pkgdesc="Yet another make"
arch=('any')
url="https://github.com/spapanik/yamk"
license=('MIT')
depends=('python-tomlkit')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha512sums=('667faf801fc9600f8d3bfeb9db05e0ddba3916a0fb9bed6f7189747ddfd248b561ec309a0677dd8db1e665b2524f57d7c935c25a88412a6bf41f5cfd651917b0')

build() {
	cd "${srcdir}"/${_pipname}-${pkgver}
	ls -la
	python setup.py build
}

package() {
	echo "https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz"
	cd "${srcdir}"/${_pipname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
