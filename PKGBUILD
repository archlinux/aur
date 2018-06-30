# Maintainer: NeedlessTyping <misguidedemails@gmail.com> 

pkgname=python-pywal-spotify-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Sync pywal colour scheme and wallpaper with Spotify"
arch=('any')
url="https://gitlab.com/misguidedemails/pywal-spotify/"
license=('GPL3')
depends=('python-pywal' 'feh' 'playerctl' 'python-requests' 'python-pillow')
makedepends=('python-setuptools')
source=("git+https://gitlab.com/misguidedemails/pywal-spotify.git")
sha256sums=('SKIP')

build(){
  cd "pywal-spotify"
  python setup.py build
}

check(){
  cd "pywal-spotify"
  python setup.py test
}

package() {
  cd "pywal-spotify"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
