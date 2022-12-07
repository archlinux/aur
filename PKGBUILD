# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.12
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy>=2.0.0' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3' 'python-numpy' 'libzip')
source=("https://github.com/sanderland/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7641fed489593bbecc81fc5ee7fca3b7344841a724ce2a411248ab23d24e3dd4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
