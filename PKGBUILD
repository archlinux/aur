# Maintainer: Arshaluys Smbatyan <ash.smbatyan@gmail.com>

pkgbase=zsh-utility-git
pkgname=zsh-utility
pkgver=r3.e508a34
pkgrel=1
pkgdesc="Misc functions"
arch=('any')
url="https://github.com/AshSmbatyan/zsh-utility"
license=('GPL3')
makedepends=("git")
source=("git+${url}.git")
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm 755 ./utility.zsh "$pkgdir/usr/bin/utility"
}
