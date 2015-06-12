# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=sigal
pkgver=0.9.2
pkgrel=1
pkgdesc="Simple static gallery generator"
arch=('any')
url="https://github.com/saimn/sigal"
license=('MIT')
depends=('python' 'python-click' 'python-jinja' 'python-markdown' 'python-pillow'
         'python-pilkit' 'python-blinker')
source=("http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('70a739895d432f2046e6cdbf4eee6d2d')

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
