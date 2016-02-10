# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# vim:set noet sts=4 sw=4 ts=4 tw=76:

_pyname=oletools
pkgname=python2-oletools
pkgver=0.42
pkgrel=1
pkgdesc="Python tools to analyze security characteristics of MS Office and OLE files"
depends=('python2')
arch=('any')
url="https://bitbucket.org/decalage/oletools"
license=('BSD')
source=("https://bitbucket.org/decalage/oletools/downloads/$_pyname-$pkgver.tar.gz")
sha512sums=('4c9a1141b7d3e59010e5af93acced268c7c027c9049232b67fad8b0770de3cc55a9ca87178fb9d714bc485d95e9cf0f10b30101fc61b7ab6f1caf40d5ea427af')

package() {
	cd "$srcdir/$_pyname-$pkgver"
	python2 setup.py install -O1 --root=$pkgdir
	install -Dm 644 ${_pyname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
	cp ${_pyname}/doc/* "${pkgdir}/usr/share/doc/${pkgname}"

}

