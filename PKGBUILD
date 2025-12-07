# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=owasp-core-ruleset
_name=coreruleset
pkgver=4.21.0
pkgrel=1
pkgdesc="OWASP ModSecurity Core Rule Set"
arch=('any')
url="https://github.com/coreruleset/coreruleset/"
license=('Apache-2.0')
depends=(
  apache
  modsecurity # either libmodsecurity2 in AUR or libmodsecurity (v3) in extra
)
source=("${pkgname}-${pkgver}.zip::https://github.com/coreruleset/coreruleset/archive/refs/tags/v${pkgver}.zip"
        "${pkgname}.install")
sha256sums=('a0cf0b9ac12f7138d35d96cedfdfeaa0259f69c8add01688865357005c6d98c4'
            '9e2bd146b6608d0b1e1b786e35f5f8ea8eefc2a149854876f92127e0536d0e09')

package() {
    mkdir -p "${pkgdir}/etc/httpd/conf"
    cp -r "${_name}-$pkgver" "${pkgdir}/etc/httpd/conf/owasp-modsecurity-crs"
    cd "${pkgdir}/etc/httpd/conf/owasp-modsecurity-crs"
    rm -fR \
      .changes-pending.md \
      .editorconfig \
      .github \
      .gitignore \
      .gitmodules \
      .linelint.yml \
      .pre-commit-config.yaml \
      .yamllint.yml \
      util \
      tests \
      docs
}
