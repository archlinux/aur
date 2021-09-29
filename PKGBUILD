# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fanninger Thomas <thomas at fanninger dot at>

pkgname=prosody-mod-default-bookmarks
pkgver=r2199.2582d09d2ec4
pkgrel=1
pkgdesc="This module allows you to add default bookmarks for users."
arch=('any')
url="https://modules.prosody.im/mod_default_bookmarks.html"
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
  cd "${srcdir}/prosody-modules/mod_default_bookmarks"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
