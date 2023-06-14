# Maintainer: Arshaluys Smbatyan <ash.smbatyan@gmail.com>

pkgname=zsh-utility-git
pkgver=r3.e508a34
pkgrel=1
pkgdesc="Misc functions"
arch=('any')
url="https://github.com/AshSmbatyan/zsh-utility"
license=('GPL3')
makedepends=("git")
source=("git+https://github.com/AshSmbatyan/zsh-utility.git")
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
