#Maintainer: KarlWithK < jocelinc60 at outlook d@t com >
pkgname=python-lookatme
_pkgname=lookatme
pkgver=2.3.0
pkgrel=3
pkgdesc='An interactive, extensible, terminal-based markdown presentation tool.'
arch=('any')
url="https://github.com/d0c-s4vage/lookatme"
license=('MIT')
depends=('python-pygments' 'python-urwid' 'python-yaml' 'python-mistune' 'python-marshmallow' 'python-click')
makedepends=('python-setuptools')
optdepends=('python-lookatme-ueberzug: renders images with the image_ueberzug extension' 'python-lookatme-render: render code blocks of supported languages into images' 'python-lookatme-qrcode: embeds qrcodes in the presentation')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/d0c-s4vage/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('b0b87698c224225f54896d3a63de910e')

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
