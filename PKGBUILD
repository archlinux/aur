# Maintainer: robertfoster

pkgname=droidrunco
pkgver=2.4.2
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

sha256sums=('82c7365b89656b0f21250f7fc6c7be7a085752c496c858bfe5ed0845fcd4b13d')
