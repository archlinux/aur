# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=plex-mpv-shim
pkgver=1.7.15
pkgrel=1
pkgdesc="Cast media from Plex Mobile and Web apps to MPV"
arch=('any')
url='https://github.com/iwalton3/plex-mpv-shim'
license=('MIT')
depends=(
  'python'
  'mpv'
  'python-mpv'
  'python-requests'
  'python-mpv-jsonipc'
)
optdepends=(
  'git'
  'python-pystray'
  'tk'
)
makedepends=(
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7c6d00ece16a871e1d12c589f02ab681')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
