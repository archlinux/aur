# Maintainer: Caesim404 <caesim404 at gmail dot com>
    
pkgname=python2-cfscrape
_pypiname=${pkgname/python2-/}
pkgver=1.9.1
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page, using Requests"
arch=(any)
url="https://github.com/Anorov/cloudflare-scrape"
license=(MIT)
depends=(python2-requests python2-pyexecjs nodejs)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Anorov/cloudflare-scrape/master/LICENSE")
sha256sums=('9cee3708c643904eaa010a64dd1715890457bb77010d87405fc1bfeb892508d7'
            '0dee0611b80471ef37e44bd2e7bcbc59e19251b2f24bf9753cefed002830787a')
package() {
	cd "${srcdir}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	cd "${_pypiname}-${pkgver}"
	
	python2 setup.py install --root="$pkgdir" --optimize=1
}
