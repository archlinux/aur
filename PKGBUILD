# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=sigal
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple static gallery generator"
arch=('any')
url="https://github.com/saimn/sigal"
license=('MIT')
depends=('python' 'python-click' 'python-jinja' 'python-markdown' 'python-pillow'
         'python-pilkit' 'python-blinker')
source=("https://pypi.python.org/packages/e4/7b/73e8eb052d768d8d7d347d0fa213fb9dd666c3f109b4dd55dffb4dc4238f/$pkgname-$pkgver.tar.gz")
md5sums=('4833c2020a41f147985a7a088a7e3b3a')

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
