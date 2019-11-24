# maintainer: craftyguy <clayton@craftyguy.net>
pkgname=prosody-mod-conversejs-hg
pkgver=r3758.900ea02ab00b
pkgrel=1
pkgdesc="Prosody module that serves a small snippet of HTML that loads Converse.js"
arch=('any')
url="https://modules.prosody.im/mod_conversejs.html"
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
  cd "${srcdir}/prosody-modules/mod_conversejs"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  install -Dm 644 template.html "${pkgdir}/usr/lib/prosody/modules/template.html"
  install -Dm 644 template.js "${pkgdir}/usr/lib/prosody/modules/template.js"
}
