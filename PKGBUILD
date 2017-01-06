# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=sigal
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple static gallery generator"
arch=('any')
url="https://github.com/saimn/sigal"
license=('MIT')
depends=('python' 'python-click' 'python-jinja' 'python-markdown' 'python-pillow'
         'python-pilkit' 'python-blinker')
source=("https://files.pythonhosted.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a7316d735d10842c6e3ecbea55a77988')

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
