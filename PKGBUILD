# Maintainer: Angel Velasquez <angvp@archlinux.org>  
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=python38-cairo
pkgver=1.21.0
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library"
arch=('x86_64')
url="https://pycairo.readthedocs.io/en/latest/"
license=('LGPL2.1' 'MPL')
depends=(cairo python38)
makedepends=(python38-setuptools)
checkdepends=(python38-pytest)
source=(https://github.com/pygobject/pycairo/releases/download/v$pkgver/pycairo-$pkgver.tar.gz{,.sig})
sha256sums=('251907f18a552df938aa3386657ff4b5a4937dde70e11aa042bc297957f4b74b'
            'SKIP')
validpgpkeys=(0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC) # Christoph Reiter <reiter.christoph@gmail.com>

build() {
  cd pycairo-$pkgver
  python3.8 setup.py build
}

check() {
  cd pycairo-$pkgver
  python3.8 setup.py test
}

package() {
  cd pycairo-$pkgver
  python3.8 setup.py install --root="$pkgdir" --skip-build --optimize=1
}
