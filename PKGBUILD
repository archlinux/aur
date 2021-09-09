# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-md2html
pkgver=1.3.0
pkgrel=2
pkgdesc="Markdown to HTML converter"
arch=('any')
url="https://github.com/chrispyles/markdown-to-html"
license=('Apache')
depends=('python-markdown2' 'python-pygments' 'python-yaml')
makedepends=('python-setuptools')
conflicts=('md4c') ## both have md2html binaries
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/md2html/md2html-$pkgver.tar.gz")
sha256sums=('f0cf6e6c7fcaddcf10eef13bd3f9d437ee699ca369ed7c52b3c914d9ed6dcb4e')

build() {
	cd "md2html-$pkgver"
	python setup.py build
}

# check() {
# 	cd "md2html-$pkgver/"
# 	python -m unittest test/test_package.py
# }

package() {
	cd "md2html-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
