# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=replace
pkgver='1.0.4'
pkgrel='1'
pkgdesc='Search and replace tool for strings on the all system'
arch=('any')
url='https://github.com/yoarch/replace'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=('https://files.pythonhosted.org/packages/source/r/replacefs/replacefs-1.0.4.tar.gz')
#source=('https://files.pythonhosted.org/packages/06/25/7c9d2578d49b6ff55d1990b5c669c1079e1a15db40ce9318f22498299ec5/replacefs-1.0.4.tar.gz')
sha256sums=('5712f2e30089bb25db79b97c6e6d74a80b03d8d96e2dd3e89a52dc7d603d3d73')

build() {
  cd $srcdir/replacefs-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/replacefs-${pkgver}

  python setup.py install --root="$pkgdir/"  --optimize=1

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  #install -m 644 COPYING  "${pkgdir}/usr/share/licenses/${pkgname}"
}
