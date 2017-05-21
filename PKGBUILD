# Maintainer: bindh3x <bindh3x@gmail.com>
# Contributor: Robert Ma (Hexcles) <bob1211@gmail.com>
# Contributor: Ariel Popper <a@arielp.com>

_gitname="powerline-extra-symbols"
pkgname="otf-powerline-extra-symbols-git"
pkgver=r37.4eae6e8
pkgrel=1
pkgdesc='Extra glyphs for powerline separators'
url='https://github.com/ryanoasis/powerline-extra-symbols'
license=('MIT')
arch=('any')
makedepends=('git')

source=("git+https://github.com/ryanoasis/powerline-extra-symbols.git")
install=powerline-extra-symbols.install
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm644 "PowerlineExtraSymbols.otf" "${pkgdir}/usr/share/fonts/OTF/PowerlineExtraSymbols.otf"
}
