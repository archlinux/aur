# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python2-cfscrape
_pypiname=${pkgname/python2-/}
pkgver=1.7.1
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python2-requests python2-js2py)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Anorov/cloudflare-scrape/master/LICENSE")
md5sums=("f430cde47e1c90d31e5b3b06b740c4ba"
         "93d4804f061e05530be1a85b24185408")


package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	cd "${_pypiname}-${pkgver}"
	
	python2 setup.py install --root="$pkgdir" --optimize=1
}
