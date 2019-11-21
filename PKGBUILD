# maintainer: craftyguy <clayton@craftyguy.net>
pkgname=prosody-mod-bookmarks2-hg
pkgver=r3755.bb18a1f5e9d7
pkgrel=1
pkgdesc="Interop between XEP-0048 and XEP 0402 for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_bookmarks2.html"
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
  cd "${srcdir}/prosody-modules/mod_bookmarks2"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
