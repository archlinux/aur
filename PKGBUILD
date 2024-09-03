#Maintainer: KarlWithK < jocelinc60 at outlook d@t com >
#Maintainer: asm0dey <me@asm0dey.site>
pkgname=python-lookatme
_pkgname=lookatme
pkgver=3.0.0.rc5
_fullver=3.0.0-rc5
pkgrel=2
pkgdesc='An interactive, extensible, terminal-based markdown presentation tool.'
arch=('any')
url="https://github.com/d0c-s4vage/lookatme"
license=('MIT')
depends=('python-pygments' 'python-urwid' 'python-yaml' 'python-mistune' 'python-marshmallow' 'python-click' 'python-markdown-it-py' 'python-linkify-it-py' 'python-dateutil')
makedepends=('python-setuptools')
optdepends=('python-lookatme-ueberzug: renders images with the image_ueberzug extension' 'python-lookatme-render: render code blocks of supported languages into images' 'python-lookatme-qrcode: embeds qrcodes in the presentation')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/d0c-s4vage/${_pkgname}/archive/v${_fullver}.tar.gz")
md5sums=('912cf093652093fcaadeda365f62aee7')

build() {
  cd "$srcdir/$_pkgname-${_fullver}"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-${_fullver}"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
