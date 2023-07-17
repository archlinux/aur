#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=deepsource-cli-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Command line interface to DeepSource"
arch=(x86_64)
url=https://github.com/deepsourcelabs/cli
license=(BSD)
source=("$url/releases/download/v$pkgver/deepsource_${pkgver}_linux_${arch[0]}.tar.gz")
sha256sums=('13eca489bdc7b5a69aa3801f6575e7f54ecc66ac850fc63e61d1248eafa6d382')

package() {
	cd "$srcdir" || return 1
	install -D "deepsource" -t "$pkgdir/usr/bin"
}
