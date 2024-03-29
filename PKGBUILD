# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.53
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
optdepends=('fd: for finder module'
            'fzf: for finder module'
            'wl-clipboard: for clipboard module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c60f7551e22573003f460d3639f01183c3a2a7330d886bef9c867519815a668e')
b2sums=('83a07a089c515c6d8bb297fcd69dcff2b203c752c56b6a40672bb49f96e68328b94ba353fee5d8a4f442ec8129be92143c36d5aaad6c2e16357f8fa8808d1b1b')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
