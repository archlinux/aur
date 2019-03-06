# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=dogtail
pkgver=0.9.11
pkgrel=1
pkgdesc="GUI test tool and automation framework"
arch=('any')
license=('GPL')
url='https://gitlab.com/dogtail/dogtail'
depends=('python' 'hicolor-icon-theme')
makedepends=('python-setuptools')
source=("https://gitlab.com/$pkgname/$pkgname/raw/released/$pkgname-$pkgver.tar.gz")
sha256sums=('801a15b183916df5adadd50338e82f76426b5b598477d2dc5e2258b1ce47236b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
