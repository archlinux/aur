pkgname=prosody-mod-throttle_presence
pkgver=r2165.e0b8b8a50013
pkgrel=1
pkgdesc="throttle presence updates in prosody to save power"
arch=('any')
url="https://modules.prosody.im/mod_throttle_presence.html"
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
  cd "${srcdir}/prosody-modules/mod_throttle_presence"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
