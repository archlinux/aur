# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=code-stats-bash
pkgname="$_pkgname-git"
pkgver=r42.96a6ead
pkgrel=1
pkgdesc="code::stats plugin for bash"
arch=(any)
url=https://github.com/Freed-Wu/code-stats-bash
license=(MIT)
depends=(bash curl)
makedepends=(git)
source=("git+$url#tag=96a6eadf17ac51261359d7fc58358687a9cf9abe")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D ./*.sh -t "$pkgdir/usr/share/code-stats-bash"
}
