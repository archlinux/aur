# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-http-libjs
pkgver=2022.07.18
pkgrel=1
_commit="75b6e5df65f9"
pkgdesc="Serve common Javascript libraries"
arch=('any')
url="https://modules.prosody.im/mod_http_libjs.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
optdepends=("jquery: for the default html templates"
            "bootstrap: for the default html templates")
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_http_libjs"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
