# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_repo=lennonwoo/zathura-solarized
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}-git
pkgver=r3.d63c710
pkgrel=1
pkgdesc="the solarized color theme for zathura"
arch=(any)
url=https://github.com/$_repo
license=(unknown)
depends=(zathura)
source=("git+$url#tag=d63c710065f666fc120d2be2a2bf589d545a538e")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D "$_pkgname"-* -t "$pkgdir/usr/share/zathura/themes"
}
