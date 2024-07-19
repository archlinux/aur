# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.101
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
source=("${url}/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('04879e0aba3f744ec306a90eaf5faae9ebcf09cf8fa7dda35811d37df3af5cb4')
b2sums=('7d721363cca4f9917f74c4ad3cb0093a24b4260dc160a94493a896c3d893a51f37350b850674fcc442e8cdd97cb0301b8bcd23d0437b3f29f6a49303b165613f')

build() {
  cd ${pkgname}-v.${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-v.${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
