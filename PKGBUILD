#Maintainer: KarlWithK < jocelinc60 at outlook d@t com >
pkgname=python-lookatme-qrcode
_pkgname=lookatme.contrib.qrcode
pkgver=2.1.0
pkgrel=2
pkgdesc='Lookatme extension adds QR code rendering capabilities to the code blocks.'
arch=('any')
url="https://github.com/d0c-s4vage/lookatme.contrib.qrcode"
license=('MIT')
depends=('python-lookatme' 'python-pyqrcode')
makedepends=('python-setuptools')
optdepends=('python-lookatme-ueberzug: renders images with the image_ueberzug extension' 'python-lookatme-render: render code blocks of supported languages into images')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/d0c-s4vage/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1058bb388097b2f55b7af2408b5f2f29')

build() {
  cd "$srcdir/$_pkgname-${pkgver}"
  python setup.py build
}

check() {
  cd $srcdir/$_pkgname-$pkgver
  pytest
}

package() {
  cd "$srcdir/$_pkgname-${pkgver}"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
