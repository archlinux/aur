# Maintainer: Ruben De Smet <aur AT rubdos DOT be>

pkgname=rofi-mpd-git
_gitname=Rofi_MPD
pkgver=r55.a712f8d
pkgrel=1
pkgdesc="A Rofi menu for interacting with MPD written in Python."
arch=('i686' 'x86_64')
url="https://github.com/JakeStanger/Rofi_MPD"
license=('MIT')
makedepends=('git')
depends=('python' 'python-mpd2')

source=("git+https://github.com/JakeStanger/Rofi_MPD.git")

sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname/

  python setup.py build
}

package() {
  cd $_gitname/

  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}
