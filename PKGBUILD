# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.9.3
pkgrel=2
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy>=2.0.0' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3' 'libzip')
source=("https://github.com/sanderland/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bc3d396c70e65e8c0d17cfd90c804c7d79e27cbdaeb59789dd58bbe51096bcea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
