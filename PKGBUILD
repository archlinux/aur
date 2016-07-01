# Maintainer: Dino Duratović <dinomol  mail  com>
pkgname=obquit-git
pkgver=r51.e819f9a
pkgrel=1
pkgdesc="Simple logout script for Openbox"
arch=('any')
url="https://github.com/dglava/obquit"
license=('GPL3')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3')
makedepends=('git')
source=('git+https://github.com/dglava/obquit.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir"

  # install license
  install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
