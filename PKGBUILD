# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=arch-wiki-search
_origpkgname=arch_wiki_search
pkgver=20250827
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
source=("https://files.pythonhosted.org/packages/b4/af/44f9315a2b901c78691188c2e35bf6303c06c52db7e4aa535a89bc0b906b/arch_wiki_search-20250827.tar.gz")
sha256sums=("27e67c092dfcf18028a9e9cd5eda5a5ec89d72847c542d565bf0fd94a5240abd")
package() {
    cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}