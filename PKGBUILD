# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.77
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
sha256sums=('2b8342c5e076cf5deb190910bbfbeb8289bf0ebccdec316f592363b0762f376a')
b2sums=('1ad074fa8ba422cc62e6289ccd48596b3adbaaca3975b215ea5cca7fdf6e1dd3ce9dad40a385be6eff19329327b29336d13f701abcf0f5544d531d5b8aa59f61')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
