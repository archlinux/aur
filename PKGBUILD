# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=jq.sh
pkgname=$_pkgname-bin
_pkgver=1.0.0-1
pkgver=${_pkgver//-/.r}
pkgrel=1
pkgdesc='jq-in-shell integration library'
_arch=any
arch=($_arch)
license=(MPL2)
url='https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh'
depends=('sh' 'jq' 'moreutils')
optdepends=('yq: Adds support for yq, xq and tomlq')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://git.stefanwimmer128.io/api/v4/projects/150/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('1417e84a6dfe59c9930c876263999694e8162f9e05542e5010e3195180d86288')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
