# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.44
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
sha256sums=('63ffdd3c139ddb2ab199120d667d0860d2ca7913090559fee777bc08d9df9356')
b2sums=('f260f695fd7104f4f13275f648f4dda7bd8264c07a444a487b2fecbc117afc5075e08610b247ff226cd84a3c85b0cb631bfc1bb6e398cdd6d1fbc87bb92ed3d7')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
