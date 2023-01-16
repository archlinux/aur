# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_repo=eastack/zathura-gruvbox
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}-git
pkgver=r7.0b49904
pkgrel=1
pkgdesc="the gruvbox color theme for zathura"
arch=(any)
url=https://github.com/$_repo
license=(unknown)
depends=(zathura)
source=("git+$url#tag=0b49904fe77e6eb676a6318c1acb03afeb2965bb")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D "$_pkgname"-* -t "$pkgdir/usr/share/zathura/themes"
}
