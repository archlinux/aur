# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.40
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3cf71e93cec8bc19beb3754a0de946e4ffea4ebea3eaf2287bb55969538d8f1e')
b2sums=('7c5acbd9c8b8dd5e2863b0cc9499b8673e5e165059a2479b9181c153091440fe0d3dcf69d081f566b72123d6ca01aafb3176ceb0c91cf5b698e06fc436c6ba95')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
