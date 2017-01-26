# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python2-js2py
_pypiname=Js2Py
pkgver=0.43
pkgrel=1
pkgdesc="JavaScript to Python translator & JavaScript interpreter written in 100% pure Python"
arch=(any)
url="https://github.com/PiotrDabkowski/Js2Py"
license=(MIT)
depends=(python2-pyjsparser python2-six python2-tzlocal)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/PiotrDabkowski/Js2Py/master/LICENSE.md")
md5sums=("ebc56834f07012322f8a19bb6a4e74b0"
         "faa744092d3fb3314632e815e7c3a560")


package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	
	cd "${_pypiname}-${pkgver}"
	
	python2 setup.py install --root="$pkgdir" --optimize=1
}
