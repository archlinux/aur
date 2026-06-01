# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.137 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('848fa6c54651c2277153bf09188257bf9a00fdf6cba542f0cb5ea5756a4fccead0abfbcf046be86e588450f3f3212bf2e998a54c690a583ad1ceae5913a2e740')
sha512sums_aarch64=('d727cd08bfbc11a998c554a80f09bf8ce8bb656f69dcd2ec0bde62c0426b427679fec395f2fea570874f1dfcaf9763a08ae6acad44dc1a33b258c070022790ae')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
