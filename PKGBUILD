# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=timeago
pkgname=python-${_pkgname}
pkgver=1.0.16
pkgrel=1
pkgdesc="Very simple python library, used to format datetime with \`***time ago\` statement."
arch=('any')
url="https://github.com/hustcc/timeago"
license=('MIT')
depends=('python')
makedepends=('python-installer')
provides=()
# use wheel distribution directly as no source distribution is available
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}-py3-none-any.whl"
        "https://raw.githubusercontent.com/hustcc/timeago/${pkgver}/LICENSE")
sha256sums=('9b8cb2e3102b329f35a04aa4531982d867b093b19481cfbb1dac7845fa2f79b0'
            'e2a15cd0b56cfffbb99e27caeb87afe58ff78097d9c3bd3aea2a251145479912')

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" "${_pkgname}-${pkgver}-py3-none-any.whl"
}
