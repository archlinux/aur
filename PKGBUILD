# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-auth-external-hg
pkgver=tip
pkgrel=2
pkgdesc="Authenticate Prosody users using a custom binary/script (DEPRECATED UPSTREAM)"
arch=('any')
url="https://modules.prosody.im/mod_auth_external.html"
license=('MIT')
depends=('prosody' 'lua52-lpty')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_auth_external_insecure"
  mkdir -p "${pkgdir}/usr/lib/prosody/modules/" "${pkgdir}/usr/share/doc/${pkgname}"
  cp mod_auth_external_insecure.lua "${pkgdir}/usr/lib/prosody/modules/mod_auth_external.lua"
  cp -r examples README.markdown "${pkgdir}/usr/share/doc/${pkgname}/"
}
