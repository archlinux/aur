# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-librosa
pkgver=0.4.3
pkgrel=1
pkgdesc="Python library for music and audio analysis"
url="http://librosa.github.io/librosa"
depends=('python2')
license=('ISC')
arch=('any')
source=("https://github.com/librosa/librosa/archive/${pkgver}.tar.gz")
md5sums=('e812b8882fc7d07de4b0037f6dfda723')

build() {
  cd $srcdir/librosa-${pkgver}
  python2 setup.py build
}

package() {
  cd $srcdir/librosa-${pkgver}
  python2 setup.py install --root="$pkgdir" --optimize=1 
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgver}/LICENSE
}
