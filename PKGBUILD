# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Carl George < arch at cgtx dot us >

pkgname="mkdocs"
pkgver=1.5.3
pkgrel=2
pkgdesc="Project documentation with Markdown"
url="https://www.mkdocs.org"
license=("BSD")
arch=("any")
provides=("mkdocs")
conflicts=("python-mkdocs")
depends=("python-babel"
         "python-click"
         "python-dateutil"
         "python-ghp-import"
         "python-jinja"
         "python-livereload"
         "python-markdown"
         "python-markupsafe"
         "python-mergedeep"
         "python-mdx-gh-links"
         "python-packaging"
         "python-pathspec"
         "python-pyyaml-env-tag"
         "python-yaml"
         "python-watchdog")
makedepends=("python-hatchling" "python-pathspec" "python-build" "python-installer" "python-wheel")
optdepends=("python-lunr: to prebuild search index")
options=("!strip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=('d1e7ac739ea3a78f2a2d294a28c721f95cb8be6c114a5131893e346254ed1937218cc0d247e75092876d7f42dc04c8060fdc8d7535326f26a8f68ec11bc7045b')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
