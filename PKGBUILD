# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=citation-style-language/styles
_source_type=github-releases
_upstreamver='v0.0.219'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=$(tr A-Z a-z <<<${_repo/\//-})
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Citation Style Language (CSL) citation styles"
arch=(any)
url=https://github.com/$_repo
license=(CCPL:by-sa)
optdepends=('pandoc: support pandoc --citeproc')
source=("$url/archive/$_upstreamver.tar.gz")
sha256sums=('e27574f972d94c9967b93c91d537526fd3014755ccafa6f954fe4d31e0215d10')

package() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1
	install -D ./*.csl -t "$pkgdir/usr/share/haskell-pandoc/$_pkgname"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
