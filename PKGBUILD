# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=mediaqbot
pkgname=${_gitname}-git
pkgver='r35.7e0799d'
pkgrel=1
arch=('any')
pkgdesc='A media scheduler mpv'
license=('MIT')
depends=('mpv')
conflicts=('mediaqbot')
makedepends=('git' 'python-setuptools')
provides=('mediaqbot')
url='https://github.com/raffomania/mediaqbot'
source=("git+https://github.com/raffomania/mediaqbot.git")
sha256sums=('SKIP')

package() {
  cd "${_gitname}"
  git submodule update --init --recursive

  cd client
  # Install
  python setup.py install --optimize=1 --root="${pkgdir}"

  # Install License
  # MIT/X11 license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
