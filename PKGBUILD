pkgname=prosody-mod-csi-hg
pkgver=r2165.e0b8b8a50013
pkgrel=1
pkgdesc="XEP-0352: Client State Indication for prosody"
arch=('any')
url="https://modules.prosody.im/mod_csi.html"
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
  cd "${srcdir}/prosody-modules/mod_csi"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
