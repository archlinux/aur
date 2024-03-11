# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=bmv
pkgver=0.0.12
pkgrel=1
pkgdesc='drop-in mv replacement with bulk moving support'
url='https://github.com/abenz1267/bmv'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('bmv')
provides=('bmv')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('75e52d21ef10454a06a1e18611b7dc127167701de0009322e3a5f29c623d2248')
b2sums=('c2bcaa6013ebf9b0437f882aeb806053d30d8f60c90adbe3b278e3a92091032f2543043d5e1e01a689e1f2f9ea6923b8ae31a08f78fbbfd68a350a3fcbeaef2d')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 bmv -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
