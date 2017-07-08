# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=dogtail
pkgver=0.9.10
pkgrel=1
pkgdesc="GUI test tool and automation framework"
arch=('any')
license=('GPL')
url='https://gitlab.com/dogtail/dogtail'
depends=('python' 'hicolor-icon-theme')
source=("https://gitlab.com/$pkgname/$pkgname/raw/released/$pkgname-$pkgver.tar.gz")
sha256sums=('ab84f9e691fea621a178d89e8cbd00830dd2bcbd945f48b91b122a445b645e93')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
