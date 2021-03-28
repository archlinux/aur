#Maintainer: KarlWithK < jocelinc60 at outlook d@t com >
pkgname=python-lookatme-render
_pkgname=lookatme.contrib.render
pkgver=1.1.0
pkgrel=1
pkgdesc='Render code blocks of supported languages into images'
arch=('any')
url="https://github.com/d0c-s4vage/lookatme.contrib.render"
license=('MIT')
depends=('python-lookatme')
makedepends=('python-setuptools')
optdepends=('python-lookatme-ueberzug: renders images with the image_ueberzug extension' 'python-lookatme-qrcode: embeds qrcodes in the presentation')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/d0c-s4vage/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('a71bae3ea33bde404a013bd6b230d2c8')

build() {
  cd "$srcdir/$_pkgname-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-${pkgver}"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
