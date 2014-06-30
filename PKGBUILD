# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=mysearch
pkgver=1.3
pkgrel=1
pkgdesc="Local search engine portal designed to anonymate your search requests and have a better display of search results"
arch=("any")
url="http://codingteam.net/project/mysearch"
license=("AGPL")
depends=("twisted" "python2-pyopenssl" "python2-jinja" "python2")
source=(http://codingteam.net/project/mysearch/download/file/${pkgname}-${pkgver}.tar.gz
	mysearch)

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
	cd "${srcdir}"
	install -Dm755 mysearch ${pkgdir}/usr/bin/mysearch
}

sha1sums=('106a3251b75f2d130dafb2887fb1a09c775212c2'
          '0f785b50876af5f7e4e5b7166da39b1d72d88f27')
