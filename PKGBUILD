# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.134 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('11e63516a1d32cfb0000a90590ae3be43c2741e47a27015da542b64d6d8b38900964c2646b539d99701bfbf4bf76d64dc997a37e5fed458bf4544a6fbe8a4c0a')
sha512sums_aarch64=('7a00e82c0f72e107740c4102ad07468fb6cd319db8638ad262c1b1e74f57ec0637727a2ba2dd90efdef622a05b3a15d0edc1c16fa16b8eefc80f1c965e9a63a3')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
