# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=notevim-git
pkgver=0.r13.18f2688
pkgrel=3
pkgdesc="A script to help you manage your notes and access them quickly"
arch=('x86_64' 'i686')
license=('BSD')
url=('https://github.com/winged/notevim')
depends=('wmctrl')
provides=('notevim' 'notevim-git')
conflicts=()
#makedepends=('python2-setuptools')
optdepends=('python2-neovim: If you want to use it with Neovim')

source=("$pkgname::git://github.com/winged/notevim.git"
        "LICENSE::https://raw.githubusercontent.com/winged/notevim/master/LICENSE")
sha256sums=('SKIP' '2eb36a7daa0b8aebd44467eefd37ef289c99cfdd4c7189d5c436a7bef8ce1c51')
pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  if [ ! -d "$pkgdir/usr/bin" ]; then
    mkdir -p "$pkgdir/usr/bin"
  fi
  install notevim "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
