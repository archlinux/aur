# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=arch-wiki-search
_origpkgname=arch_wiki_search
pkgver=20250829
pkgrel=1
pkgdesc="Read and search Archwiki and other wikis, online or offline, on the desktop or the terminal"
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
    "python-markdownify"
    "python-markdown"
)
makedepends=(
    "python-build"
    "python-hatchling"
    "python-installer" 
)
optdepends=(
    "python-pyqt6: control through notification area on desktop"
    "python-textual: control through start menu like icon on console"
    "elinks: console browsing"
    "w3m: console browsing"
    "firefox: desktop environment browsing"
    "chromium: desktop environment browsing"
    "brave: desktop environment browsing"
)
source=("https://files.pythonhosted.org/packages/f4/ec/12b107c2938bcb1c5b8563abd17a35d63dc20608c3842042c91b07094dbc/arch_wiki_search-20250829.tar.gz")
sha256sums=("4fa329c27ea5fe8b4a0b931eddb1912e279ea266bcb06f7bd7d421abebc70a54")
package() {
    cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}