# Maintainer: Sean Haugh <seanphaugh@gmail.com>

pkgname=python-pywal
pkgver=1.2.2
pkgrel=1
pkgdesc="Generate and change colorschemes on the fly"
arch=('any')
url="https://github.com/dylanaraps/pywal/"
license=('MIT')
depends=('python'
         'python-setuptools'
         'imagemagick')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper')
provides=("python-pywal=$pkgver-$pkgrel")
source=("https://github.com/dylanaraps/${pkgname#python-}/archive/${pkgver}.tar.gz")
md5sums=('f792058e60fd947bd01f7077a4b5b7e1')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/${pkgname#python-}-${pkgver}/LICENSE.md" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
