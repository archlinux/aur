# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname=python2-cfscrape
_pypiname=${pkgname/python2-/}
pkgver=2.0.3
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python2-requests nodejs)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('e0afdd8a6d5456c6c96555b9a71cdd41d3eaa3f14a8a032d64b700cb26ce98fd')


package() {
	cd "${srcdir}/${_pypiname}-${pkgver}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
