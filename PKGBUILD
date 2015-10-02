# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=sigal
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple static gallery generator"
arch=('any')
url="https://github.com/saimn/sigal"
license=('MIT')
depends=('python' 'python-click' 'python-jinja' 'python-markdown' 'python-pillow'
         'python-pilkit' 'python-blinker')
source=("http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ed6f2dc0886997851cda8b88de853bc7')

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
