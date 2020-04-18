# Maintainer: AnySomebody <anysomebody@gmx.de>

pkgname=rofi-spotify-git
_gitname=rofi-spotify
pkgver=r46.17d7cd0
pkgrel=1
pkgdesc="A python program to interact with Spotify via rofi based on spotipy"
arch=('any')
url="https://github.com/AnySomebody1/rofi-spotify"
license=('GPL')
provides=('rofi-spotify')
conflicts=('rofi-spotify')
makedepends=('git' 'binutils' 'python-setuptools' 'fakeroot')
depends=('python' 'python-appdirs' 'python-spotipy' 'python-rofi-git' 'rofi')

source=("git+https://github.com/AnySomebody1/rofi-spotify.git")

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
