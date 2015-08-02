# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=obquit-git
pkgver=0.1.0.r2.g39861b4
pkgrel=2
pkgdesc="Simple logout script for Openbox"
arch=('any')
url="https://github.com/dglava/obquit"
license=('GPL3')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3')
makedepends=('git')
provides=('obquit')
conflicts=('obquit')
source=('git+https://github.com/dglava/obquit.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir"
}
