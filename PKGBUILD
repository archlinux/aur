# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-mermaid2-plugin"
pkgver=1.2.3
_sdist=mkdocs_mermaid2_plugin
pkgrel=1
pkgdesc="A Mermaid graphs plugin for MkDocs"
url="https://github.com/fralau/mkdocs-mermaid2-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-mermaid2-plugin-git")
replaces=("python-mkdocs-mermaid2-plugin-git")
depends=("mkdocs" "python-jsbeautifier" "python-beautifulsoup4" "python-pymdown-extensions" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_sdist::1}/${_sdist}/${_sdist}-${pkgver}.tar.gz")
b2sums=('4400efa70fb54d57955e4a981e990cfae8dbedc42c0adce10edf96310e8ebdc58b245019afa96cac8a1af39c857a02ed7c3c621b254a621b81977bede3eb05f9')

build(){
 cd "${_sdist}-${pkgver}"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_sdist}-${pkgver}"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
