pkgname=prosody-mod-csi-hg
pkgver=r1769.f2705465cab4
pkgrel=1
pkgdesc="XEP-0352: Client State Indication for prosody"
arch=('any')
url="https://code.google.com/p/prosody-modules/wiki/mod_csi"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://code.google.com/p/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_csi"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
