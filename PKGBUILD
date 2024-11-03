# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_name=mmh3
pkgname=python-${_name}
pkgver=5.0.1
pkgrel=1
arch=('any')
pkgdesc="Python extension for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
url="http://packages.python.org/${_name}"
depends=('python')
# makedepends=('python-setuptools')
makedepends=(python-build python-installer python-wheel)
license=('MIT')
source=("https://pypi.io/packages/source/m/${_name}/${_name}-${pkgver}.tar.gz")
sha1sums=('888e6a9f17bbb5d09be9b779858c4e3dab2d8edd')
sha256sums=('7dab080061aeb31a6069a181f27c473a1f67933854e36a3464931f2716508896')
sha512sums=('29ea15cb8aed07a72e987206531c0f96c480b57fa96a2da82d0594b8f754f29a6ea010c1179c3cc4debe0d5cb6d67fe217dd4f7964cbc314fa543240a3784f00')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

