# Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
# Contributor: Alberto Redondo <albertomost at gmail dot com>

pkgname=lyrics-in-terminal
pkgver=1.8.0
pkgrel=2
pkgdesc='Shows lyrics of songs from your favourite music player in terminal'
arch=('any')
url='https://github.com/Jugran/lyrics-in-terminal'
license=('MIT')
depends=('python>=3.6' 'dbus-python' 'ncurses')
makedepends=('python-setuptools')
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4e60603e2cbe1bcf5b206a9a8c1e3516')

build() {

  cd ${pkgname}-${pkgver}

  python setup.py build

}

package() {

  cd ${pkgname}-${pkgver}

  python setup.py install \
    -O1 \
    --root="${pkgdir}" \
    --skip-build

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
