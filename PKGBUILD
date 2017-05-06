# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=mediaqbot
pkgname=${_gitname}-git
pkgver='r35.7e0799d'
pkgrel=1
arch=('any')
pkgdesc='A media scheduler mpv'
license=('MIT')
depends=('mpv' 'youtube-dl' 'python-mpv-git')
conflicts=('mediaqbot')
makedepends=('git' 'python-setuptools')
provides=('mediaqbot')
url='https://github.com/raffomania/mediaqbot'
source=("git+https://github.com/raffomania/mediaqbot.git")
sha256sums=('SKIP')

prepare() {
    cd "${_gitname}"
}

package() {
  cd "${_gitname}/client"
  # Install
  python setup.py install --optimize=1 --root="${pkgdir}"

  cd ../

  # Install MIT License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
