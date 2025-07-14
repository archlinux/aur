# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.20.1 # renovate: datasource=github-releases depName=hcavarsan/kftray
pkgrel=1
pkgdesc="🦀 ⚡ kubectl port forward manager, with support for UDP and proxy connections through k8s clusters"
url="https://github.com/hcavarsan/kftray"
license=('GPL-3.0-only')
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64"
)
arch=('x86_64' 'aarch64')
sha512sums_x86_64=('8d86ba8909e22547561e7bfed554aaeeefc29c65fb876845300d5d0532a1f9f88cd0ffa1cf3abca0aa38908f5a90eb1622b1b2eb6f22fb68c782a1c2ffc308e2')
sha512sums_aarch64=('54bac534ddbbedc858d1c110d17be88026c6632bfbd3c0ae067447c93b55e5442718998ef0790134b189eaf66a54f7695b4fbd8983af217e325a2b249990dd74')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
