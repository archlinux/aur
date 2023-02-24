# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=owasp-core-ruleset
_name=coreruleset
pkgver=3.3.4
pkgrel=1
pkgdesc="OWASP ModSecurity Core Rule Set"
arch=('any')
url="https://github.com/coreruleset/coreruleset/"
license=('Apache')
depends=(apache modsecurity)
source=("https://codeload.github.com/coreruleset/coreruleset/zip/refs/tags/v$pkgver")
sha256sums=('6ee408cb06c1c8ba27ecc8bf1cd65b25815e196b4d8aa0833bc3fe858987be81')

package() {
	mkdir -p "$pkgdir/etc/httpd/conf"
	cp -r "$_name-$pkgver" "$pkgdir/etc/httpd/conf/owasp-modsecurity-crs"
	chown -R http:http "$pkgdir/etc/httpd/conf/owasp-modsecurity-crs"
}
