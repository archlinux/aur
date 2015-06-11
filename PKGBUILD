pkgname=prosody-mod-mam-hg
pkgver=r1767.ca48eea4785c
pkgrel=1
pkgdesc="XEP-0313: Message Archive Management for Prosody"
arch=('any')
url="https://code.google.com/p/prosody-modules/wiki/mod_mam"
license=('MIT')
depends=('prosody-hg')
makedepends=('mercurial')
source=("hg+https://code.google.com/p/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_mam"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
