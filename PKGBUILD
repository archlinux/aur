# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=arch-wiki-search
_origpkgname=arch_wiki_search
pkgver=20250826
pkgrel=1
pkgdesc="Read and search Archwiki and other wikis, online or offline, in HTML, markdown or text, on the desktop or the terminal"
arch=("any")
url="http://github.com/clorteau/arch-wiki-search"
license=("MIT")
depends=(
    "python-aiohttp-client-cache"
    "python-aiofiles"
    "python-aiosqlite"
    "python-aiodns"
    "python-aiohttp"
    "python-lxml-html-clean"
    "python-beautifulsoup4"
    "python-html5lib"
    "python-yaml"
)
makedepends=(
    "python-build"
    "python-hatchling"
    "python-installer" 
)
optdepends=(
    "elinks: console browsing"
    "w3m: console browsing"
    "firefox: desktop environment browsing"
    "chromium: desktop environment browsing"
)
source=("https://files.pythonhosted.org/packages/0e/02/1b383d7690bcb92d0821f79f98b8844d7d6bf5b0da115ceeeb3e7cf6a926/arch_wiki_search-20250826.tar.gz")
sha256sums=("0c83385bd293eadf875d39c5ded32dc9ea3d4d7e87b4e0dc8aa89a3f2b3b9e6f")
package() {
    cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}