# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname=python2-cfscrape
_pypiname=${pkgname/python2-/}
pkgver=2.0.5
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python2-requests nodejs)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('d95c16b0677127dfae3ea529f3601d1474cae7e325278e1d9d89a2a73ef21fa9')


package() {
	cd "${srcdir}/${_pypiname}-${pkgver}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
