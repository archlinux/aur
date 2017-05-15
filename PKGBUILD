# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-auth-ldap2-hg
pkgver=tip
pkgrel=1
pkgdesc="LDAP authentication through OpenLDAP for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_auth_ldap2.html"
license=('MIT')
depends=('prosody' 'prosody-mod-lib-ldap-hg')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_auth_ldap2"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
