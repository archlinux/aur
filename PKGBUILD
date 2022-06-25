# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=arpy
pkgname="python-$_name"
pkgver=2.3.0
pkgrel=1
pkgdesc="Library for accessing 'ar' files"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        'LICENSE.txt')
sha256sums=('8302829a991cfcef2630b61e00f315db73164021cecbd7fb1fc18525f83f339c'
            'f787c775443ab80564df12aade9809d710ae43f3e11962a0385470bad0b6134c')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
