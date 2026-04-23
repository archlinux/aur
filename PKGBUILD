# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.116 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('f7051ddec8fc5e2dcb136064baa0bba795b3230b48bdbc3ff1f06ce23b090b3fc119cc67e736d4b5a0188bc7cc6c30631ce36a1a104e7c535f9cd40284ce833c')
sha512sums_aarch64=('122d7117c02a3dc855606feb186a7f127a198ad936fba3517cdc4f7568351dceae977f59dc40ad921eba3b95c36b254e75f20d257fb79f7dbdf523dc86bc3eee')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
