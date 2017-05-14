# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-auto-accept-subscriptions-hg
pkgver=tip
pkgrel=1
pkgdesc="automatically accept subscriptions from other contacts (friendly environment)"
arch=('any')
url="https://modules.prosody.im/mod_auto_accept_subscriptions.html"
license=('MIT')
depends=('prosody>=0.8')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_auto_accept_subscriptions"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
