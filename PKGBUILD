# Maintainer: Cebtenzzre <cebtenzzre (AT) gmail (DOT) com>
pkgname=gigatribe
pkgver=3.06.015
pkgrel=1
pkgdesc='Create your own secure and private network to share files with friends.'
arch=(x86_64)
url='https://www.gigatribe.com/'
license=('LicenseRef-GigaTribe')
depends=(zlib hicolor-icon-theme)
options=(!emptydirs !strip)
source=("https://www.gigatribe.com/software/linux/${pkgname}_${pkgver}-1.deb"
        'LICENSE.html::https://www.gigatribe.com/en/legal')
sha256sums=('3df024609b56d2e48bfc77ec56c9bac1f5f8e2a42edca0d5364f7bbd319351e9'
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
