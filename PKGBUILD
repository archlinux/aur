# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.12.2
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy>=2.0.0' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3' 'python-numpy' 'libzip')
source=("https://github.com/sanderland/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6f38ca950d899146f72200d437dcd8da62bbc01bc1114b2962297d69ea5200e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
