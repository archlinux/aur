# Maintainer: rustemb <rustemb@systemli.org>
pkgname=profetch
pkgver=0.1.0
pkgrel=1
pkgdesc="System Information Fetcher Written in GNU/Prolog "
arch=(any)
url="https://github.com/RustemB/profetch"
license=('GPL3')
depends=(glibc)
makedepends=(gprolog)
optdepends=()
provides=(profetch)
conflicts=(profetch-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('de7ad85d1ee2987bdf83ae426631904e')

build() {
	cd "$pkgname-$pkgver"
	./build.sh
}

package() {
	cd "$pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mv profetch ${pkgdir}/usr/bin
  mv LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
