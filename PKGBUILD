# Maintainer: quest <quest@mac.com>
pkgname=python-ygglatency
_pkgname="ygglatency"
pkgver=0.2.3
pkgrel=2
pkgdesc="Find the fastest Yggdrasil peers."
arch=("any")
url="https://pypi.python.org/pypi/$_pkgname"
license=("MIT")
depends=("python" "python-beautifulsoup4" "python-requests" "python-icmplib")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/53/6e/6dd6a6eb852df35a28d99f5a5b3490e5ff55eac0316ebe2a6ad3bb3ee287/$_pkgname-$pkgver.tar.gz")
sha256sums=('615c8d21192bcc163b2fdba95eed3e2229c1d9ade6d573b0c69f3eb34f75fbae')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
