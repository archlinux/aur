# Maintainer: Fanninger Thomas <thomas at fanninger dot at>

pkgname=prosody-mod-mam-archive
pkgver=r2199.2582d09d2ec4
pkgrel=1
pkgdesc="XEP-0136: Message Archiving for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_mam_archive.html"
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
  cd "${srcdir}/prosody-modules/mod_mam_archive"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}