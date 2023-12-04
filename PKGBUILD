# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=owasp-core-ruleset
_name=coreruleset
pkgver=3.3.5
pkgrel=2
pkgdesc="OWASP ModSecurity Core Rule Set"
arch=('any')
url="https://github.com/coreruleset/coreruleset/"
license=('Apache')
depends=(apache modsecurity)
source=("${pkgname}-${pkgver}.zip::https://codeload.github.com/coreruleset/coreruleset/zip/refs/tags/v$pkgver"
        "${pkgname}.install")
sha256sums=('6f4cb06cc4aa463d19218779f19df4524029ce7393f6af7b8577cd308e749fb4'
            '9e2bd146b6608d0b1e1b786e35f5f8ea8eefc2a149854876f92127e0536d0e09')

package() {
    mkdir -p "${pkgdir}/etc/httpd/conf"
    cp -r "${_name}-$pkgver" "${pkgdir}/etc/httpd/conf/owasp-modsecurity-crs"
    cd "${pkgdir}/etc/httpd/conf/owasp-modsecurity-crs"
    rm -fR .yamllint.yml .travis.yml .linelint.yml .gitmodules .gitignore .github util tests docs
}
