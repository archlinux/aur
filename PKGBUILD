# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname=python2-cfscrape
_pypiname=${pkgname/python2-/}
pkgver=1.9.5
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python2-requests nodejs)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('cb9159955d0e6e82cf4ad8cc9b19413e68ebfed1ce98a26e51f62e66d45146f1')

package() {
	cd "${srcdir}/${_pypiname}-${pkgver}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
