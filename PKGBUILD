pkgname=prosody-mod-http-upload
pkgver=r2165.e0b8b8a50013
pkgrel=1
pkgdesc="XEP-0363: Allow clients to upload files over HTTP."
arch=('any')
url="http://modules.prosody.im/mod_http_upload.html"
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
  cd "${srcdir}/prosody-modules/mod_http_upload"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
