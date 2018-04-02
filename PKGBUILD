# Maintainer: Sean Haugh <seanphaugh@gmail.com>

pkgname=python-pywal
pkgver=2.0.3
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
md5sums=('c690af4bf0acabd8dec80c71ab753c76')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/${pkgname#python-}-${pkgver}/LICENSE.md" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
