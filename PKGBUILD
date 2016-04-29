# Maintainer: Lee Fenlan <lee@fenlan.uk>

pkgname=fira-code-git
pkgver=r107.bbdcdff
pkgrel=1
pkgdesc="Fira Code font. Monospaced font with programming ligatures"
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/tonsky/FiraCode"
license=()
groups=()
depends=()
makedepends=('git')
optdepends=()
provides=('${pkgname%-git}')
conflicts=('${pkgname%-git}')
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=(${pkgname}::git+https://github.com/tonsky/FiraCode.git)
noextract=()
md5sums=('SKIP')
#sha1sums=()
#sha256sums=()
#sha384sums=()
#sha512sums=()
validpkgkeys=(FEB63203)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
}

package() {
  install -Dm644 $pkgname/FiraCode-Bold.otf "$pkgdir"/usr/share/fonts/fira_code/FiraCode-Bold.otf
  install -Dm644 $pkgname/FiraCode-Light.otf "$pkgdir"/usr/share/fonts/fira_code/FiraCode-Light.otf
  install -Dm644 $pkgname/FiraCode-Medium.otf "$pkgdir"/usr/share/fonts/fira_code/FiraCode-Medium.otf
  install -Dm644 $pkgname/FiraCode-Regular.otf "$pkgdir"/usr/share/fonts/fira_code/FiraCode-Regular.otf
  install -Dm644 $pkgname/FiraCode-Retina.otf "$pkgdir"/usr/share/fonts/fira_code/FiraCode-Retina.otf
}
# vim:set ts=2 sw=2 et:

