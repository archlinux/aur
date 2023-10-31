# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=owasp-core-ruleset
_name=coreruleset
pkgver=3.3.5
pkgrel=1
pkgdesc="OWASP ModSecurity Core Rule Set"
arch=('any')
url="https://github.com/coreruleset/coreruleset/"
license=('Apache')
depends=(apache modsecurity)
source=("https://codeload.github.com/coreruleset/coreruleset/zip/refs/tags/v$pkgver")
sha256sums=('6f4cb06cc4aa463d19218779f19df4524029ce7393f6af7b8577cd308e749fb4')

package() {
	mkdir -p "$pkgdir/etc/httpd/conf"
	cp -r "$_name-$pkgver" "$pkgdir/etc/httpd/conf/owasp-modsecurity-crs"
	chown -R http:http "$pkgdir/etc/httpd/conf/owasp-modsecurity-crs"
}
