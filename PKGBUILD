# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_repo=Freed-Wu/code-stats-bash
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}-git
pkgver=r40.7c3891c
pkgrel=1
pkgdesc="code::stats plugin for bash"
arch=(any)
url=https://github.com/$_repo
license=(MIT)
depends=(bash curl)
source=("git+$url#tag=7c3891c45dca327571124c1d4a8f8dec0fefec42")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D ./*.sh -t "$pkgdir/usr/share/code-stats-bash"
}
