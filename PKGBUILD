# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-filter-chatstates-hg
pkgver=tip
pkgrel=2
pkgdesc="Client State Indication module to filter chat states depending on the client state"
arch=('any')
url="https://modules.prosody.im/mod_filter_chatstates.html"
license=('MIT')
depends=('prosody>=0.11')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_filter_chatstates"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
