# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.5
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3')
source=("https://github.com/sanderland/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e4a535e3c0342c390379d3897ac201169ac52a988d359c60fa1daecab6d9ac7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
