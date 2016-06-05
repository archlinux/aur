# Maintainer: Fanninger Thomas <thomas at fanninger dot at>

pkgname=prosody-mod-mam-muc
pkgver=r2199.2582d09d2ec4
pkgrel=1
pkgdesc="XEP-0313: Message Archive Management for MUC for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_mam_muc.html"
license=('MIT')
depends=('prosody' 'prosody-mod-mam')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_mam_muc"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
