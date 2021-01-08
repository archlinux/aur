# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-invites
pkgver=2020.09.11
pkgrel=1
_commit="24f4eb35ab60"
pkgdesc="Invite management module for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_invites.html"
license=('MIT')
depends=('prosody' 'prosody-mod-http-libjs')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_invites"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
