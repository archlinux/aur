# Maintainer: RushAur <nojunkmails at t-online dot de>
pkgname=rainbow-icons-git
pkgver=r229.b8077462
pkgrel=1
pkgdesc="A multi-colour icon theme."
arch=('any')
url="https://github.com/0devnull0/rainbow-icons"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
conflicts=(surfn-icons-git menda-circle-icon-theme-git)
provides=(surfn-icons-git)
options=(!strip !emptydirs)
source=('git+https://github.com/0devnull0/rainbow-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/rainbow-icons"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd rainbow-icons
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' 'Surfn' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn Orange' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn Majestic' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn Arch Blue' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Menda Circle' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/
}
# vim:set ft=sh ts=2 sw=2 et:
