# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.11
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy>=2.0.0' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3' 'libzip')
source=("https://github.com/sanderland/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e5f18cc962659f1498e11d5df5d1057d1fa15184b484168c1d654a7aee7dda64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
