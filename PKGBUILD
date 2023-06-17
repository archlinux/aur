# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=python-mdx-gh-links
pkgver=0.3
pkgrel=1
pkgdesc="An extension to Python-Markdown which adds support for shorthand links to GitHub users, repositories, issues and commits."
arch=('any')
url="https://pypi.org/project/mdx_gh_links/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Python-Markdown/github-links/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4bd219c8f64dd017e9df18b33f87bb3f88efda428081ee4dd48508419517a538')

build() {
	cd "github-links-$pkgver"
	python setup.py build
}

package() {
	cd "github-links-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

