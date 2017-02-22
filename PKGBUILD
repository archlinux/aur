# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python-cfscrape
_pypiname=${pkgname/python-/}
pkgver=1.7.0
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python-requests python-js2py)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Anorov/cloudflare-scrape/master/LICENSE")
md5sums=("7376565bca5bc82f151e95d78c4d5e77"
         "93d4804f061e05530be1a85b24185408")


package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	cd "${_pypiname}-${pkgver}"
	
	python setup.py install --root="$pkgdir" --optimize=1	
}
