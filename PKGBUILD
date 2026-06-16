# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.27.30 # renovate: datasource=github-releases depName=hcavarsan/kftray
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
sha512sums_x86_64=('002bacf6ef1a2c9878548a62c4b7dc5fdfa39bb5f6e8b7184ec5e20b85367925189311389630975ab230bfbb651aabfddf42481b837fd6e4f7a89fb06a9f9e9d')
sha512sums_aarch64=('980028ba70b414f964bd9df9e3c2ed0c6cb1ae3111d04c8c0728a94e6ae4b65bf6bbb05dcde604fde79eb35b9eb0245bc440fb48f3318252b920d052a69c102a')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
