# Maintainer: algebro <algebro at tuta dot io>

pkgname=katrain
pkgver=1.11.2
pkgrel=1
pkgdesc="A tool for analyzing and playing go with AI feedback from KataGo."
arch=('i686' 'x86_64')
url="https://github.com/sanderland/katrain"
license=('MIT')
depends=('python' 'python-certifi' 'python-chardet' 'cython' 'python-dataclasses' 
'python-docutils' 'python-idna' 'python-kivy>=2.0.0' 'python-kivymd' 'python-pillow' 
'python-pygame' 'python-pygments' 'python-requests' 'python-urllib3' 'python-numpy' 'libzip')
source=("https://github.com/sanderland/${pkgname}/archive/v${pkgver}fixes-for-osx.tar.gz")
sha256sums=('3fcbd1a23bda9c1558fcf0ef1728496632d67c60c120ea2fd6d04a13a6cf6aed')

build() {
  cd "$srcdir/$pkgname-$pkgver"fixes-for-osx
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"fixes-for-osx
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
