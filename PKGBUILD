# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=pygments-markdown-lexer
pkgname=python-$_pyname
pkgver=0.1.0.dev39
pkgrel=2
pkgdesc='A Markdown lexer for Pygments to highlight Markdown code snippets'
url='https://pypi.python.org/pypi/pygments-markdown-lexer'
depends=('python-pygments')
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.zip")
md5sums=('6360fe0f6d1f896e35b7a0142ce6459c')

build() {
  cd $srcdir/$_pyname-$pkgver
  rm -r src/pygments_markdown_lexer.egg-info
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  rm -r "$pkgdir/usr/EGG-INFO"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
