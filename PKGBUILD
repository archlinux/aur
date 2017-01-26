# Maintainer: David Runge <dave@sleepmap.de>
pkgname=prosody-mod-admin-message-hg
pkgver=r2463.e2d955f6167f
pkgrel=1
pkgdesc="A console over XMPP. All the commands of the mod_admin_telnet module are available from an XMPP client."
arch=('any')
url="https://modules.prosody.im/mod_admin_message.html"
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
  cd "${srcdir}/prosody-modules/mod_admin_message/"
  install -Dm 644 mod_admin_message.lua "${pkgdir}/usr/lib/prosody/modules/mod_admin_message.lua"
  install -Dm 644 README.markdown "${pkgdir}/usr/share/doc/prosody-mod-admin-message/README.markdown"
}
