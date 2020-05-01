# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/Thann/play-with-mpv
# Upstream: https://github.com/Thann/play-with-mpv

pkgname=play-with-mpv-git
pkgver=0.1.0.post3+g0c27cd4
pkgrel=1
pkgdesc='Chrome extension and python server that allows you to play videos in webpages with MPV instead.'
arch=('any')
url='https://github.com/Thann/play-with-mpv'
license=('MIT')
depends=('python' 'python-wheel' 'youtube-dl' 'mpv')
optdepends=('peerflix' 'mkchromecast')
makedepends=('git' 'python-setuptools')
provides=('play-with-mpv')
conflicts=('play-with-mpv')
source=("$pkgname::git+https://github.com/Thann/play-with-mpv.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "$(python setup.py --version | tail -n1)"
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
