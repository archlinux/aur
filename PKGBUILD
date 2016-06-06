# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=sigal
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple static gallery generator"
arch=('any')
url="https://github.com/saimn/sigal"
license=('MIT')
depends=('python' 'python-click' 'python-jinja' 'python-markdown' 'python-pillow'
         'python-pilkit' 'python-blinker')
source=("https://pypi.python.org/packages/87/ac/96290def54870b8d5303f2a99b145a5eb8ea2f662ded44da884c225e910c/sigal-1.2.0.tar.gz")
md5sums=('ba3cd3d10e48a88ac33043352682be7d')

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
