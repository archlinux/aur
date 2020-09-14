_pipname=yamk
pkgname="python-${_pipname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Yet another make"
arch=('any')
url="https://github.com/spapanik/yamk"
license=('MIT')
depends=('python-tomlkit')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha512sums=('ae635710e95256297ec99c9d9f7e8a669c942b462753f648965f3c17f0d926dfaedc8fb3a1fe405adb0a9cc266acb129074c77c22d7ffb96a2e0b20467c985bf')

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
