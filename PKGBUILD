# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=mpd-art-box
pkgver=0.0.9
pkgrel=1
pkgdesc="A window displaying the cover for the currently playing MPD track"
url='https://github.com/nvllsvm/mpd-art-box'
arch=('any')
license=('MIT')
depends=(
    'python-configargparse' 
    'python-gobject' 
    'python-mpd2'
)
makedepends=('python-setuptools')
source=(https://github.com/nvllsvm/mpd-art-box/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4a9534df31d2b2810b1546cc1e7f5337b1b79e35ae761116d9301501db6a4f33e07b1cf920c6cd1a821a146f8688149d2576a508422b99d8f556ec1ca9816315')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package(){
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
}
