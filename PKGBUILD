# Maintainer: qwjyh <urataw421 at gmail dot com>


pkgname=python-mkdocs-autolinks-plugin
_pkgname="${pkgname#python-}"
_name=$_pkgname
pkgver=0.7.1
pkgrel=1
pkgdesc="An MkDocs plugin that automagically generates relative links between markdown pages"
depends=('python' 'mkdocs')
makedepends=('python-setuptools')
arch=('any')
url="https://github.com/zachhannum/mkdocs-autolinks-plugin"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('445ddb9b417b7795856c30801bb430773186c1daf210bdeecf8305f55a47d151')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: sw=2:
