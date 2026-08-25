# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=1.4.10 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('817a193e23b5023da5785487eb88278fa126c6a6470857849bba513ba5da808f875f3f068839496297b0fac3e2afa91483d3d93e09edff1d920657c43233a3bb')
sha512sums_aarch64=('231e4438e8b93ebecedd267660aa591b1693ec3dcf45c4db656285ff1f727490ef6dbd2a0e1b4930fa720580b037dfef14a2a583fab948fb368daf1c978275b1')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
