# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>


pkgname='python-libjpeg-turbo'
pkgdesc='A Python wrapper of libjpeg-turbo for decoding and encoding JPEG image'
pkgver='1.5.2'
pkgrel=1
url='https://github.com/lilohuang/PyTurboJPEG'
license=('MIT')
arch=('any')
depends=('python-numpy'
         'libjpeg-turbo')
makedepends=('python-setuptools')
source=("https://github.com/lilohuang/PyTurboJPEG/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96e0a8805fb5106fa49dc0d7ee1e9bbfe44a3479fa76c226552fac2d2704031e')

package() {
  cd "${srcdir}/PyTurboJPEG-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
