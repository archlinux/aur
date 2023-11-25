# Maintainer: gi1242 <gi1242+arch at gmail dot com>

pkgname=md-to-html2
pkgver=0.2
pkgrel=1
pkgdesc='Convert Markdown to HTML using Jinja2 templates'
url='https://codeberg.org/gi1242/md-to-html'
arch=('any')
license=('MIT')
depends=(python python-frontmatter python-jinja python-markdown python-pyxdg
  python-pillow python-pygments)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('297217f496a2d0f55f93c1353a439d03cff78cd858b65dae3f5ce67477a2668b')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package(){
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 :
