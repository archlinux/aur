# Maintainer: Cebtenzzre <cebtenzzre (AT) gmail (DOT) com>
pkgname=gigatribe
pkgver=3.06.006
pkgrel=1
pkgdesc='Create your own secure and private network to share files with friends.'
arch=(x86_64)
url='https://www.gigatribe.com/'
license=('custom')
depends=(zlib)
options=(!emptydirs)
source=("https://www.gigatribe.com/software/linux/${pkgname}_${pkgver}-1.deb"
        'LICENSE.html::https://www.gigatribe.com/en/legal')
sha256sums=('eb5a2b4c97db48906b51eeb80b10cabea118252166df9ae275785815a26d9098'
            'e9825c6317e648ba2d056b99c4708f975acc8d873a6a25fe24d43863bceba4ba')

prepare() {
  mkdir extract
  cd extract
  bsdtar -xf ../data.tar.xz
}

package() {
  cp --preserve=mode -rT extract "$pkgdir"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.html
}
