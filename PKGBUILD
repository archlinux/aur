#Maintainer: KarlWithK < jocelinc60 at outlook d@t com >
pkgname=python-lookatme-ueberzug
_pkgname=lookatme.contrib.image_ueberzug
pkgver=1.1.0
pkgrel=1
pkgdesc='Provides image rendering support for python-lookatme'
arch=('any')
url="https://github.com/d0c-s4vage/lookatme.contrib.image_ueberzug"
license=('MIT')
depends=('python-lookatme' 'python-urwid-ueberzogen' 'python-ueberzug')
makedepends=('python-setuptools')
optdepends=('python-lookatme-render: render code blocks of supported languages into images' 'python-lookatme-qrcode: embeds qrcodes in the presentation')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/d0c-s4vage/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1d6763b776f8d663199a140d177796b0')

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
