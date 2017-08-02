# Maintainer: Sean Haugh <seanphaugh@gmail.com>

pkgname=python-pywal
pkgver=0.5.10
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
source=("https://github.com/dylanaraps/${pkgname#python-}/archive/${pkgver}.tar.gz")
md5sums=('d1c0a616c4a26bc71bb99336c6254f75')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/${pkgname#python-}-${pkgver}/LICENSE.md" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
