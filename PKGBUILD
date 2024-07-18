# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.98
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('665f63eee9eb5e17edd071c81c125eea6f77474631126b0d8ceec8eac32664b6')
b2sums=('769fcaa629f46660ef9a68407da7c07904036d9c58a3170dfbc5d4f6e2ef8ae902321f228013116e4a4e3b7b4a2cc09d06c419a93acf28149c8c073bbbbb7aa3')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
