# Maintainer: algebro <algebro at tuta dot io>

_pkgname=katrain
pkgname=python-$_pkgname
pkgver=1.3.4
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3')
source=("https://github.com/sanderland/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3498ffa3763f880b00e6c15c6cb0f73ffeeddd780e4ab5040726ef608ab2e8f4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
