# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python-js2py
_pypiname=Js2Py
pkgver=0.50
pkgrel=1
pkgdesc="JavaScript to Python translator & JavaScript interpreter written in 100% pure Python"
arch=(any)
url="https://github.com/PiotrDabkowski/Js2Py"
license=(MIT)
depends=(python-pyjsparser python-six python-tzlocal)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/PiotrDabkowski/Js2Py/master/LICENSE.md")
sha256sums=('99592acc3d2b79cd5f9d13340b305582d16415df87c8c47005cf75cb73a89193'
            'e477271a50c40c9ac3ad56d02e70c7d7d97f66c7326cf524d13b12f8842cc4e9')

package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	
	cd "${_pypiname}-${pkgver}"
	
	python setup.py install --root="$pkgdir" --optimize=1	
}
