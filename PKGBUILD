# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=bmv
pkgver=0.0.13
pkgrel=1
pkgdesc='drop-in mv replacement with bulk moving support'
url='https://github.com/abenz1267/bmv'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('bmv')
provides=('bmv')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('63e31df4c5888dc42ca5e33f499da64f8a826542f2bd1c76cff12e4b0bf50f00')
b2sums=('6df12d330862651e86253211399c85b1c8d896f9ed9bbbbbf1276ef42e4539c8e9672a822db2f347dde0a42362be8422c0edcb3ca584d0df43479f69dcf79af6')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 bmv -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
