# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=gnofract4d
pkgver=4.3
pkgrel=2
pkgdesc="Create beautiful fractal images"
arch=('any')
url="https://github.com/fract4d/gnofract4d"
license=('BSD')
depends=('gtk3' 'libjpeg' 'libpng' 'python-cairo' 'python-gobject')
makedepends=('python-setuptools')
optdepends=('ffmpeg: to create videos')
checkdepends=('python-pytest')
source=("https://github.com/edyoung/gnofract4d/archive/v$pkgver.tar.gz")
md5sums=('d815353c682eab9787e2fdad26f625ba')

build() {
  cd $pkgname-$pkgver
  ./setup.py build
}

check() {
  cd $pkgname-$pkgver
  ./test.py
}

package() {
  cd $pkgname-$pkgver

  install -dm755 "$pkgdir/usr/share/man/man1"
  install -Dm644 doc/gnofract4d.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  ./setup.py install --root="$pkgdir" --optimize=1
}

