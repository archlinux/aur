# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=python-mdx-gh-links
_pkgname=mdx_gh_links
pkgver=0.2
pkgrel=1
pkgdesc="An extension to Python-Markdown which adds support for shorthand links to GitHub users, repositories, issues and commits."
arch=('any')
url="https://pypi.org/project/mdx_gh_links/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/38/e7/76324cb45a3b655a3f4392e5e1c771a1b9a6b938700d7f9ac31fcbb43377/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('59fb8dafdf62bd0757593d6ab1f13b554d1d3ef0dcc44bedea2eca71970cf398')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

