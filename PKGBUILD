# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=deepsourcelabs/cli
_source_type=github-releases
_upstreamver='v0.5.2'

pkgname=deepsource-cli-bin
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Command line interface to DeepSource"
arch=(x86_64)
url=https://github.com/$_repo
license=(BSD)
source=("$url/releases/download/$_upstreamver/deepsource_${pkgver}_linux_${arch[0]}.tar.gz")
sha256sums=('3b90a4992cff0ee3cc8ab88adf077d0d28d726b78c19883a017c53dce403090a')

package() {
	cd "$srcdir" || return 1
	install -D "deepsource" -t "$pkgdir/usr/bin"
}
