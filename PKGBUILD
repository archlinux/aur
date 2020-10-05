# Maintainer: Alberto Redondo <albertomost at gmail dot com>

pkgname=lyrics-in-terminal
pkgver=1.2.1
pkgrel=1
pkgdesc="Shows lyrics of songs from your favourite music player in terminal"
arch=('any')
url="https://github.com/Jugran/lyrics-in-terminal"
license=('MIT')
depends=('python>=3.6' 'python-dbus' 'ncurses')
source=(https://github.com/Jugran/lyrics-in-terminal/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('6ed1f0fb438e6e0b12ad46a0eee7b92a')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
