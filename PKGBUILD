# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.13.2 # renovate: datasource=github-releases depName=giantswarm/muster
pkgrel=1
pkgdesc="MCP tool management and workflow proxy"
url="https://github.com/giantswarm/$_pkgname"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkgname}-linux-arm64"
)
sha512sums_x86_64=('7409e6ba761477b9ae44630b2f59fbb4e5215dccf9c01b25b3cdb0e34555ecbc27f27345a5776a31edee7fba6cbb2e7b991c6c6f00296679eebd1a57d59eef4c')
sha512sums_aarch64=('e864e476adf2d275ff9468114fa78fd092eeefada9d82da9960f0566a472f3e9279ab753f476bb13167f5fadb692609ebdc2e260fd740635158613e016f7cd1e')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
