# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.6
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3')
source=("https://github.com/sanderland/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c371783aaa344fe3c5ceae0ada7faa45ace01256b7d3d6a45cd904f4e15ca2f6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
