# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-mermaid2-plugin"
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=3
pkgdesc="A Mermaid graphs plugin for MkDocs"
url="https://github.com/fralau/mkdocs-mermaid2-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-mermaid2-plugin-git")
replaces=("python-mkdocs-mermaid2-plugin-git")
depends=("python" "mkdocs" "python-jsbeautifier" "python-beautifulsoup4" "python-pymdown-extensions" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('4400efa70fb54d57955e4a981e990cfae8dbedc42c0adce10edf96310e8ebdc58b245019afa96cac8a1af39c857a02ed7c3c621b254a621b81977bede3eb05f9')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
