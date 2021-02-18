# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.7.6
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy>=2.0.0' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3')
source=("https://github.com/sanderland/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fb4134db5678167b5aac1355802e944cea3c4dd29c4bb1a5ec69c06c7757e07a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
