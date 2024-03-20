# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.33
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
sha256sums=('1e0fb4a534833ac57b558951e2be4ebddc17ed7ae3e02db6c5525b055395c6de')
b2sums=('4e82a5a9f45d5c3b2bbff1f8e2a37758a87892b318f3f559061279d7d9d318bb136d70d53d6bc93808cd9d6e96aa3cf0f0526f4b77cae164cc982e49c24e0876')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
