# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python-pyjsparser
_pypiname=${pkgname/python-/}
pkgver=2.5.2
pkgrel=1
pkgdesc="Fast JavaScript parser (based on esprima.js)"
arch=(any)
url="https://github.com/PiotrDabkowski/pyjsparser"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/PiotrDabkowski/pyjsparser/master/LICENSE")
sha256sums=('e4a659df3db42a2ff9fbc961eb6d4076a0b945e1aadfc20d48f913ad5dca011d'
            'ee43880fad97e97a3d77333915c22766926f1e3dcd0c3e29b112e42246fef4f1')

package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	cd "${_pypiname}-${pkgver}"
	
	python setup.py install --root="$pkgdir" --optimize=1
}
