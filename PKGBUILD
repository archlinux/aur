# Maintainer: Midov <midov@midov.pl>

pkgname=python-html-sanitizer
_name=html_sanitizer
pkgver=2.2.0
pkgrel=1
pkgdesc="Allowlist-based and very opinionated HTML sanitizer that can be used both for untrusted and trusted sources."
arch=('any')
url="https://pypi.org/project/html-sanitizer/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/b8/ca/7e3d426dce533a392b88da844424f241387222e0dca8026265289a8c69e8/${_name}-${pkgver}.tar.gz")
sha256sums=('e04e5bfdfb1940f634aaa44ab208bd189feb005ff035037057e579072321e915')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
