#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=google-drive-upload
pkgver=4.5
pkgrel=1
pkgdesc="Bash scripts to upload files to google drive"
arch=(any)
url=https://github.com/labbots/google-drive-upload
license=(MIT)
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('143bf7521fab80f5b8f5edf4180648043f900c8aa357f0b021f9ce8b06207df5')

package() {
	cd "$pkgname-$pkgver"
	install -D release/bash/* -t "$pkgdir/usr/bin"
}
