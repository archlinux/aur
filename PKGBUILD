# Maintainer: robertfoster

pkgname=droidrunco
pkgver=3.0.0 # renovate: datasource=github-tags depName=lavafroth/droidrunco
pkgrel=1
pkgdesc="Minimalist, functional Android debloat tool in Go"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/lavafroth/droidrunco"
license=('GPL3')
depends=('android-tools')
makedepends=('go' 'just')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  just build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm 755 build/"${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/GPL3" LICENSE
}

sha256sums=('6ed0c8a18fada89caaa36beeffe7e9249f2ff81a41ab66b8b853cd77159f2c1e')
