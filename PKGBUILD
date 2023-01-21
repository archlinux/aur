# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_repo=lennonwoo/zathura-solarized
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}-git
pkgver=r4.14a3d95
pkgrel=1
pkgdesc="the solarized color theme for zathura"
arch=(any)
url=https://github.com/$_repo
license=(MIT)
depends=(zathura)
source=("git+$url#tag=14a3d95d568b3120bad3f691eae4667d16a37f5d")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D "$_pkgname"-* -t "$pkgdir/usr/share/zathura/themes"
}
