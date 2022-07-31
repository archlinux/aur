# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-password-policy
pkgver=2021.12.22
pkgrel=1
_commit="bfd4af4caddc"
pkgdesc="password policy for creating accounts"
arch=('any')
url="https://modules.prosody.im/mod_password_policy.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_password_policy"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
