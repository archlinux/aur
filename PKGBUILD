#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=stardict-ecdict
pkgver=1.0.28
pkgrel=2
pkgdesc="Free English to Chinese Dictionary Database"
arch=(any)
url=https://github.com/skywind3000/ECDICT
license=(GPL3)
source=("$url/releases/download/$pkgver/ecdict-stardict-${pkgver##*.}.zip")
sha256sums=('c707d0f3ded6ec79b96466da4a1574e074703da5af9c120fbad97f9cb08c6f2c')

package() {
	install -d "$pkgdir/usr/share/stardict/dic"

	cp -r $pkgname-* "$pkgdir/usr/share/stardict/dic"
}
