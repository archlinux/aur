# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: tuxce <tuxce.net@gmail.com>

_pkgname=aurvote
pkgname=aurvote-git
pkgver=r17.b25edcc
pkgrel=1
pkgdesc='Vote for your favorite AUR packages (development version)'
url='http://git.archlinux.fr/aurvote.git'
license=('GPL')
source=('git+https://github.com/archlinuxfr/aurvote.git')
sha256sums=('SKIP')
arch=('any')
depends=('curl')
makedepends=('git')
conflicts=('aurvote')
provides=('aurvote')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  install -Dm755 aurvote "${pkgdir}/usr/bin/aurvote"
  install -Dm644 zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_aurvote"
}

# vim: ft=sh ts=2 sw=2 et
