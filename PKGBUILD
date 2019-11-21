# maintainer: craftyguy <clayton@craftyguy.net>
pkgname=prosody-mod-http-altconnect-hg
pkgver=r3755.bb18a1f5e9d7
pkgrel=1
pkgdesc="Prosody module that makes BOSH and WebSocket connection endpoints discoverable via the HTTP method described in XEP-0156"
arch=('any')
url="https://modules.prosody.im/mod_http_altconnect.html"
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
  cd "${srcdir}/prosody-modules/mod_http_altconnect"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
