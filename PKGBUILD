# Maintainer: espritlibre <email@address.invalid>"
_pkgname=zsh-extract
pkgname=zsh-extract-git
pkgver=r7156.06753e814
pkgrel=1
pkgdesc="This plugin defines a function called "extract", it extracts the archive file you pass to it and it supports a wide variety of archive filetypes."
arch=(any)
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract"
license=('unknown')
depends=("zsh")
makedepends=("git")
install="${pkgname}.install"
source=(git+https://github.com/ohmyzsh/ohmyzsh.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ohmyzsh/plugins/extract/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/extract/_extract" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
        
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/extract/extract.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
        
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/extract/README.md" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
}

