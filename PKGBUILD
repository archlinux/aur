# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fanninger Thomas <thomas at fanninger dot at>

pkgname=prosody-mod-e2e_policy
pkgver=r2199.2582d09d2ec4
pkgrel=1
pkgdesc="This module was written to encourage usage of End-to-end encryption for chat and MUC messages."
arch=('any')
url="https://modules.prosody.im/mod_e2e_policy.html"
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
  cd "${srcdir}/prosody-modules/mod_e2e_policy"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}