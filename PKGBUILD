# Maintainer: Leo Mao

pkgname="python-imageio"
_pkgname="imageio"
pkgver=2.4.1
pkgrel=1
pkgdesc="a Python library that provides an easy interface to read and write a wide range of image data"
arch=('x86_64')
_github="imageio/imageio"
_pypiname="imageio"
url="https://github.com/imageio/imageio"
license=('BSD')
depends=('python-numpy' 'python-pillow')
optdepends=('avbin' 'ffmpeg' 'freeimage' 'python-astropy' 'simpleitk')
makedepends=('python' 'python-setuptools')
source=("https://github.com/imageio/imageio/archive/v${pkgver}.tar.gz")
sha256sums=('0c0c5869830b738cbafd4c278299c7b28e179ad04920938de9109161a328b5ec')

build() {
  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:<Paste>
