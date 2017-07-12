# Maintainer: Sean Haugh <seanphaugh@gmail.com>

pkgname=python-pywal
pkgver=0.4.0.r1.g84b3725
pkgrel=1
pkgdesc="Generate and change colorschemes on the fly"
arch=('any')
url="https://github.com/dylanaraps/pywal/"
license=('MIT')
depends=('python'
         'imagemagick')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper')
provides=("python-pywal=$pkgver-$pkgrel")
source=('git+https://github.com/dylanaraps/pywal.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname#python-}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname#python-}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/${pkgname#python-}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
