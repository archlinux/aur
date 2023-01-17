# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_repo=irondoge/bash-wakatime
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}-git
pkgver=r25.c2ac2a8
pkgrel=2
pkgdesc="bash plugin for wakatime"
arch=(any)
url=https://github.com/$_repo
license=(unknown)
depends=(bash wakatime)
source=("git+$url#tag=c2ac2a80c9aa81a4d9edd55ec724cd74dbf19dd8")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D "$_pkgname.sh" -t "$pkgdir/usr/share/bash-wakatime"
}
