# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-mermaid2-plugin"
pkgver=1.1.0
pkgrel=1
pkgdesc="A Mermaid graphs plugin for MkDocs"
url="https://github.com/fralau/mkdocs-mermaid2-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-mermaid2-plugin-git")
replaces=("python-mkdocs-mermaid2-plugin-git")
depends=("mkdocs" "python-jsbeautifier" "python-beautifulsoup4" "python-pymdown-extensions" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('d45a6ca50f5cd650958b7c8057bde0d9355a63af84332fbebac98c89c09d3e65d8592e41e7b53947ebfbc3c5475b9c3540eea3c800d4fe6b3fb9f33a42a37da1')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
