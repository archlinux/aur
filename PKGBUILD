#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=svlint-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="SystemVerilog linter compliant with IEEE1800-2017"
arch=('x86_64')
url="https://github.com/dalance/svlint"
license=('MIT')
conflicts=('svlint')

source=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/svlint-v${pkgver}-x86_64-lnx.zip")

package() {
	install -Dm755 bin/* -t "$pkgdir/usr/bin"
	install -Dm644 doc/* -t "$pkgdir/usr/share/doc/svlint"
}
sha256sums=('61ac04c2311862243e34d3db8282a3d9423a0b018b2842053bf0db249a6e4f4e')
