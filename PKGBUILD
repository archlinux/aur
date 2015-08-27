# Maintainer: saneki <s@neki.me>
pkgname=i3-swap-git
_pkgname=i3-swap
pkgver=5.9699db9
pkgrel=1
pkgdesc="i3 script to swap workspaces with a dual monitor setup."
arch=("any")
url="https://github.com/saneki/i3-swap"
license=("GPL-3.0")
makedepends=(git)
depends=(bash coreutils i3-wm jshon)
source=("git://github.com/saneki/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm0755 "${_pkgname}/i3-swap.sh" "${pkgdir}/usr/bin/i3-swap"
}
