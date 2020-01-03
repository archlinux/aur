# maintainer: craftyguy <clayton@craftyguy.net>
pkgname=prosody-mod-muc-mam-hints-hg
pkgver=r3755.bb18a1f5e9d7
pkgrel=1
pkgdesc="Prosody plugin to check for MUC messages with XEP-0334 tags to qualify those messages as “historic” for later MAM archiving or not."
arch=('any')
url="https://modules.prosody.im/mod_muc_mam_hints.html"
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
  cd "${srcdir}/prosody-modules/mod_muc_mam_hints"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
