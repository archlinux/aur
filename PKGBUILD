# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python-js2py
_pypiname=Js2Py
pkgver=0.44
pkgrel=1
pkgdesc="JavaScript to Python translator & JavaScript interpreter written in 100% pure Python"
arch=(any)
url="https://github.com/PiotrDabkowski/Js2Py"
license=(MIT)
depends=(python-pyjsparser python-six python-tzlocal)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/PiotrDabkowski/Js2Py/master/LICENSE.md")
md5sums=("650a38e32807f42ced341e78786a3601"
         "faa744092d3fb3314632e815e7c3a560")


package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	
	cd "${_pypiname}-${pkgver}"
	
	python setup.py install --root="$pkgdir" --optimize=1	
}
