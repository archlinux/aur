# shellcheck shell=bash disable=SC2034
# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=bigH/interactively
_source_type=github-releases
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=$_pkgname-git
pkgver=r6.d2daf03
pkgrel=1
pkgdesc="interactively author commands - useful for awk, sed, jq"
arch=(any)
url=https://github.com/$_repo
depends=(fzf bash)
license=(custom)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -D "bin/$_pkgname" -t "$pkgdir/usr/bin"
}
