# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-invites-api
pkgver=2020.10.16
pkgrel=1
_commit="35b678609b79"
pkgdesc="Authenticated HTTP API to create invites"
arch=('any')
url="https://modules.prosody.im/mod_invites_api.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_invites_api"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
