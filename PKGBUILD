# Maintainer: gi1242 <gi1242+arch at gmail dot com>

pkgname=md-to-html2
pkgver=0.3
pkgrel=1
pkgdesc='Convert Markdown to HTML using Jinja2 templates'
url='https://codeberg.org/gi1242/md-to-html'
arch=('any')
license=('MIT')
depends=(python
	python-frontmatter
	python-jinja
	python-markdown
	python-pyxdg
	python-markupsafe
  python-pillow
	python-pygments)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('bec4ca0da6299c81e3d4beddf1403e793ff3c9e713edc98872b54b5caa966d4f')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package(){
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 :
