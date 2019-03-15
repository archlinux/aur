# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname=python-cfscrape
_pypiname=${pkgname/python-/}
pkgver=1.9.6
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python-requests nodejs)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('6aa4966be1efd8f58e768d21ec573ec334f13d9c3be3b0324df2bf912abcef94')

package() {
	cd "${srcdir}/${_pypiname}-${pkgver}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="$pkgdir" --optimize=1
}
