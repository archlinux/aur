# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glad
pkgver=0.1.34
pkgrel=1
pkgdesc='Multi-language GL/GLES/EGL/GLX/WGL loader-generator based on the official specs'
arch=(any)
url='https://github.com/Dav1dde/glad'
license=(MIT Apache)
makedepends=(git python-setuptools)
source=("git+$url#commit=a5ca31c88a4cc5847ea012629aff3690f261c7c4") # tag: v0.1.34
b2sums=(SKIP)

build() {
  cd glad
  python setup.py build
}

package() {
  cd glad
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
