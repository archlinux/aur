# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-external-services
pkgver=2021.08.30
pkgrel=1
_commit="ede9682c2022"
pkgdesc="XEP-0215: External Service Discovery for prosody (pre 0.12)"
arch=('any')
url="https://prosody.im/doc/modules/mod_external_services"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "prosody-modules/mod_external_services"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
