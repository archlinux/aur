# Maintainer: fkobayashi <see name left ＠ 数学 (but in english) dot ubc.ca

pkgname=python-opencv
_pkgname=opencv-python # Name on the PyPI
pkgver=4.5.1.48
pkgrel=1
pkgdesc="Wrapper package for OpenCV python bindings"
arch=('any')
license=('MIT')
url="https://github.com/opencv/opencv-python"
depends=(python-numpy python-scikit-build)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('0e178bd601b25a0a1ee0cd1e8c81bec0')
sha256sum=("78a6db8467639383caedf1d111da3510a4ee1a0aacf2117821cae2ee8f92ce37")



build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --prefix=/usr --root $pkgdir || return 1

  install -Dm644 LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
