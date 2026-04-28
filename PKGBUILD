# Maintainer: gi1242 <gi1242+arch at gmail dot com>

pkgname=md-to-html2
pkgver=0.4
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
	python-pygments
	python-beautifulsoup4)
makedepends=(python-build python-installer python-wheel)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('5facf86fcbed97d4b5bd0ddbb0932d74f94b339c0baed02d1ca0320cd85183e7')

_name=${_name//-/_}
build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package(){
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 :
