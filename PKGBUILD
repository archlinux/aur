# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python-pyjsparser
_pypiname=${pkgname/python-/}
pkgver=2.4.5
pkgrel=1
pkgdesc="Fast JavaScript parser (based on esprima.js)"
arch=(any)
url="https://github.com/PiotrDabkowski/pyjsparser"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/PiotrDabkowski/Js2Py/master/LICENSE.md")
md5sums=("69a028f632baf7fe79fe2df253cbfd26"
		 "faa744092d3fb3314632e815e7c3a560")


package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	
	cd "${_pypiname}-${pkgver}"
	
	python setup.py install --root="$pkgdir" --optimize=1
}
