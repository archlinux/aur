# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=dogtail
pkgver=0.9.9
pkgrel=1
pkgdesc="GUI test tool and automation framework"
arch=('any')
license=('GPL')
url='https://fedorahosted.org/dogtail/'
depends=('python' 'hicolor-icon-theme')
source=("https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5d94620bac19b23606d3ecb28e85628c5ceb505beb530af7023ce5bfb576bc5c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
