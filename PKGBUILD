# Maintainer: robertfoster

pkgname=droidrunco
pkgver=2.5.0 # renovate: datasource=github-tags depName=lavafroth/droidrunco
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

sha256sums=('f8d4fccc78c0f0bc30f8da9a7edfe9f88384e2e7c06afb6311a67c734ce8d320')
