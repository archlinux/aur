#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=hr
pkgname=$_pkgname-bash
pkgver=1.4
pkgrel=1
pkgdesc='A horizontal ruler for your terminal'
arch=('any')
url=https://github.com/LuRsT/hr
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-${pkgver}::$url/archive/${pkgver}.tar.gz")
sha256sums=('decaf6e09473cb5792ba606f761786d8dce3587a820c8937a74b38b1bf5d80fb')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
	install -D "$_pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
