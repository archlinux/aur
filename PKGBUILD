# Maintainer: Sudrien <_+aur@sudrien.net>
pkgname=eliteapi
_pkgname=EliteAPI
pkgver=3.3.9
pkgrel=1
pkgdesc="Provides API for Elite Dangerous"
arch=("x86_64")
url="https://github.com/Somfic/EliteAPI"
license=('MIT')
depends=(
  dotnet-runtime
)
makedepends=(
  dotnet-sdk
)
provides=("${pkgname%-*}=$pkgver")
conflicts=("eliteapi-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('75f47214ac7a19dcf7bf4e287c0b744543d762019296f8bfe1f6d065a0b8832c')

build() {
  cd "$srcdir/$_pkgname-${pkgver}"
	dotnet build -o out -c Release
}


package() {
  mkdir -p "$pkgdir/opt"
  mv "$srcdir/EliteAPI-${pkgver}/out" "${pkgdir}/opt/$pkgname"
}
