# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=arch-wiki-search
_origpkgname=arch_wiki_search
pkgver=20250825
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/8b/4a/18b0a7838ead09f1faf5b3351eb12aea678176d609fe614658516be08083/arch_wiki_search-20250825.tar.gz")
sha256sums=("df2e0b97f6b18363b0f6ffc245a3c5d578008b6b679e730e8bfea1bb50d2f8b0")
package() {
    cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}