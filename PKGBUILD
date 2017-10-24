# Maintainer: David Runge <dave@sleepmap.de>
_pkg=prosody-mod-admin-message
pkgname=prosody-mod-admin-message-hg
pkgver=r2808.2cc02ee82e8c
pkgrel=1
pkgdesc="A console over XMPP. All the commands of the mod_admin_telnet module are available from an XMPP client."
arch=('any')
url="https://modules.prosody.im/mod_admin_message.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "prosody-modules"
  install -Dm 0644 COPYING "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"
  cd "${srcdir}/prosody-modules/mod_admin_message/"
  install -Dm 0644 mod_admin_message.lua "${pkgdir}/usr/lib/prosody/modules/mod_admin_message.lua"
  install -Dm 0644 README.markdown "${pkgdir}/usr/share/doc/${_pkg}/README.md"
}
