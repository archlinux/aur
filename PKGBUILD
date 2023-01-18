# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_repo=Freed-Wu/code-stats-bash
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}-git
pkgver=r39.58e6695
pkgrel=2
pkgdesc="code::stats plugin for bash"
arch=(any)
url=https://github.com/$_repo
license=(MIT)
depends=(bash curl)
source=("git+$url#tag=58e6695cec290ff045c82bc568ffbb4b59ba88ed")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D ./*.sh -t "$pkgdir/usr/share/code-stats-bash"
}
