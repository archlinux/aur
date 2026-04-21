# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.113 # renovate: datasource=github-releases depName=giantswarm/muster
pkgrel=1
pkgdesc="MCP tool management and workflow proxy"
url="https://github.com/giantswarm/$_pkgname"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64"
)
sha512sums_x86_64=('5b75946cf0b195efb7010315f1bbff84114a379024d0c383cdf52ca8d4686d83f5ceaaf7f5be081f2800b0ad9d099c8848fc348ee91a1f1e119ccacda420920d')
sha512sums_aarch64=('009a97a5cf5fb514acbe85b7bdb725e7aea79898d99c39ffb86b3d2d2b86d172a55445af2074176b0ea85ac4ea6cc23973a1a57b0c95a12850d0f89ad08a5ca8')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
