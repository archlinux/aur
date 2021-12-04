# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.10.1
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy>=2.0.0' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3' 'libzip')
source=("https://github.com/sanderland/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0907031095ec48865a4240bb00e25637af27c52dd68bb1b7b2aa95918731f1ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
