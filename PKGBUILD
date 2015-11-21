# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=sigal
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple static gallery generator"
arch=('any')
url="https://github.com/saimn/sigal"
license=('MIT')
depends=('python' 'python-click' 'python-jinja' 'python-markdown' 'python-pillow'
         'python-pilkit' 'python-blinker')
source=("http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('590873eb2f8fcd3ac4ca9689b7e963ea')

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
