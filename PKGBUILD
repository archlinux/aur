# Maintainer: espritlibre <e-mail>
_pkgname=zsh-urltools
pkgname=zsh-urltools-git
pkgver=r7156.06753e814
pkgrel=1
pkgdesc="This plugin provides two aliases: "urlencode" and "urldecode" to decode/encode URL strings."
arch=(any)
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/urltools"
license=('unknown')
depends=("zsh")
makedepends=("git")
install="${pkgname}.install"
source=(git+https://github.com/ohmyzsh/ohmyzsh.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ohmyzsh/plugins/urltools/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/urltools/README.md" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
        
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/urltools/urltools.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
}

