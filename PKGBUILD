# Maintainer: Alberto Redondo <albertomost at gmail dot com>

pkgname=lyrics-in-terminal
pkgver=1.3.1
pkgrel=1
pkgdesc="Shows lyrics of songs from your favourite music player in terminal"
arch=('any')
url="https://github.com/Jugran/lyrics-in-terminal"
license=('MIT')
depends=('python>=3.6' 'python-dbus' 'ncurses')
makedepends=('python-setuptools')
source=(https://github.com/Jugran/lyrics-in-terminal/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
md5sums=('5aaaec3ec9bed307c708a9c2b0ebc6e0')
