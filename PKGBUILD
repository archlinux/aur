# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=5.63.17 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('73afd0e067e1926cf81035371cdb784bbe8053de2d6e56df6918a469dc3de979c8b614553ea9b8cf01d76437adb15c02ca635f657c8bd9b1532e48ad8a58802c')
sha512sums_aarch64=('b3c1acab94b4cfd10e3f5919d8a3c138614a5e731a953223de19465383ab54aa047e4b329c21828edcc9a071e36d173c0d046baa7bcc9b7d7e5e9723885b9023')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
