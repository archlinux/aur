# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=bmv
pkgver=0.0.11
pkgrel=1
pkgdesc='drop-in mv replacement with bulk moving support'
url='https://github.com/abenz1267/bmv'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('bmv')
provides=('bmv')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('32757766fc0341a6326a17b2b5a97448006d949ff602bab9b699d20e8ddd2637')
b2sums=('e7bc9c1aec53e43a6065cb961a91bc4d7d5ecbb086ec0a1b45dadb3ee00e6dc67527592042752010a4ef070639ad264d8e4731a7fe5dea7437734af17a02029e')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 bmv -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
