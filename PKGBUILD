# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python2-cfscrape
_pypiname=${pkgname/python2-/}
pkgver=1.6.8
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python2-requests python2-js2py)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Anorov/cloudflare-scrape/master/LICENSE")
md5sums=("481c7c386904cd75e1cb43decc1b662f"
         "93d4804f061e05530be1a85b24185408")


package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	cd "${_pypiname}-${pkgver}"
	
	python2 setup.py install --root="$pkgdir" --optimize=1
}
