# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=python-pyrdfa3
_name=pyRdfa3
pkgver=3.5.3
pkgrel=1
pkgdesc="Python distiller/parser library"
arch=('any')
url="https://github.com/RDFLib/pyrdfa3"
license=('custom')
depends=('python-rdflib' 'python-html5lib' 'python-simplejson' 'python-isodate')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
		"$pkgname.license::https://raw.githubusercontent.com/RDFLib/pyrdfa3/master/LICENSE")
sha256sums=('4da7ed49e8f524b573ed67e4f7bc7f403bff3be00546d7438fe263c924a91ccf'
            '18e8c2a924d44bdfdce3055db70bd4de7fad7f1d60df29458755a64bcb04766f')

package() {
	python -m installer --destdir="$pkgdir" "pyRdfa3-3.5.3-py3-none-any.whl"
	install -Dm644 "$pkgname.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
