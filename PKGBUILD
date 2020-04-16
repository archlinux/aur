# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-auth-imap-hg
pkgver=tip
pkgrel=1
pkgdesc="IMAP authentication module for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_auth_external.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_auth_imap"
  mkdir -p "${pkgdir}/usr/lib/prosody/modules/" "${pkgdir}/usr/share/doc/${pkgname}"
  cp auth_imap/*.lua "${pkgdir}/usr/lib/prosody/modules/"
  cp README.markdown "${pkgdir}/usr/share/doc/${pkgname}/"
}
