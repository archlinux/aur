# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-invites-adhoc
pkgver=2021.11.09
pkgrel=1
_commit="ea93b204104e"
pkgdesc="Enable ad-hoc command for XMPP clients to create invitations"
arch=('any')
url="https://modules.prosody.im/mod_invites_adhoc.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_invites_adhoc"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
