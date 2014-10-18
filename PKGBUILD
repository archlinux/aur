# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-pychromecast-git
pkgver=88.702017d
pkgrel=1
pkgdesc="Library for Python 2 and 3 to communicate with the Google Chromecast."
arch=('any')
url="https://github.com/balloob/pychromecast"
license=('MIT')
depends=('python2>=2.7' 'python2-requests' 'python2-protobuf')
provides=('python2-pychromecast')
conflicts=('python2-pychromecast')
options=(!emptydirs)
source=('git+https://github.com/balloob/pychromecast.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pychromecast"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/pychromecast"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
