# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.52
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
sha256sums=('e174ade5f7499bacb7490c2856fb74b7a9b4a8f1ed2574b78f229c4302d2bb1a')
b2sums=('c659099e77c944499735f2e9c293f32ca224c07744a7deefd4ffe27036df10cb29a2008b66fc698aeeb6f9e42d209b89bdc3654874920a0131ec9387a564b9e1')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
