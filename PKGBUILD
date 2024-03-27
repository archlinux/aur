# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.49
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
sha256sums=('2ece8281ab64b3bdddb4cc8f471211ba9058dc0a813048fc557df2ea38049072')
b2sums=('1e20a791e5653ab7005bed9fced386cdb750c35cfe9c3be646f7d1f821cdd5cc09b8864f75abafbddcc24abc6958c527595f38117626b0a5d9429b36dcf37eea')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
