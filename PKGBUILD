# Maintainer: Shimi Chen <shimi dot chen at gmail dot com>

pkgname=python-crawl4ai
_name=crawl4ai
pkgver=0.9.2
pkgrel=1
pkgdesc="Open-source LLM Friendly Web Crawler & scraper"
arch=('any')
url="https://github.com/unclecode/crawl4ai"
license=('Apache-2.0')
depends=(
  'python'
  'python-aiofiles'
  'python-aiohttp'
  'python-aiosqlite'
  'python-anyio'
  'python-beautifulsoup4'
  'python-brotli'
  'python-chardet'
  'python-click'
  'python-cssselect'
  'python-dotenv'
  'python-fake-useragent'
  'python-httpx'
  'python-humanize'
  'python-lark'
  'python-lxml'
  'python-nltk'
  'python-numpy'
  'python-patchright'
  'python-pillow'
  'python-tf-playwright-stealth'
  'python-psutil'
  'python-pydantic'
  'python-pyopenssl'
  'python-pyyaml'
  'python-rank-bm25'
  'python-requests'
  'python-rich'
  'python-shapely'
  'python-snowballstemmer'
  'litellm'
  'python-xxhash'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('58dbfa05a82c1cfa667a20383a1d0f7a42187304da5e4d0661a6f59b0ed6a406')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
