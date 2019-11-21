# maintainer: craftyguy <clayton@craftyguy.net>
pkgname=prosody-mod-bookmarks-hg
pkgver=r3755.bb18a1f5e9d7
pkgrel=1
pkgdesc="Prosody module that allows interop between older clients that use XEP-0048: Bookmarks in its 1.0 version and recent clients which use it in PEP"
arch=('any')
url="https://modules.prosody.im/mod_bookmarks.html"
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
  cd "${srcdir}/prosody-modules/mod_bookmarks"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
