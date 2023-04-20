# Maintainer: robertfoster

pkgname=droidrunco
pkgver=2.3.2
pkgrel=1
pkgdesc="Minimalist, functional Android debloat tool in Go"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/lavafroth/droidrunco"
license=('GPL3')
depends=('android-tools')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm 755 build/"${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/GPL3" LICENSE
}

sha256sums=('0932295dd458b393043da2c66be25e04ad0a984d77d2d5f99fddb83d5fda6887')
