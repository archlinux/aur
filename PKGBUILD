#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=language-server-bitbake
pkgver=2.2.0
pkgrel=1
pkgdesc="Bitbake language support"
arch=(any)
url=https://github.com/yoctoproject/vscode-bitbake
license=(MIT)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('25644edb90001f29eb3c69abbf23f8112ff947eaf8aea1ba4a6a8de34c0ad9f5')

package() {
	npm install -g --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
}
