# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Xilinx/cmakeModules
_source_type=github-tags
_upstreamver='v2022.1'
_pkgname=${_repo##*/}

pkgname=xilinx-cmake
pkgver=${_upstreamver##v}
pkgrel=2
pkgdesc="helpful CMake modules for a variety of Xilinx build flows"
arch=(any)
url=https://github.com/$_repo
depends=(cmake)
license=(BSD)
source=("$url/archive/$_upstreamver.tar.gz")
sha256sums=('af37e4394fed1c8fe3593da384f9fdf5c80c04a48b961cb43b65e13a5625fafd')

package() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1

	mkdir -p "$pkgdir/usr/lib/cmake/xilinx"
	cp ./*.cmake "$pkgdir/usr/lib/cmake/xilinx"
}
