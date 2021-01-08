# Maintainer: KokaKiwi <kokakiwi+git@kokakiwi.net>

_pkgname=mergedeep
pkgname="python-${_pkgname}"
pkgver=1.3.1
pkgrel=1
pkgdesc='A deep merge function for Python'
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bfd361e0f841eec59af894d6c0a0eec741681e710bbffd8a4d2cb321ef6d5c5c')
b2sums=('4d2d3a96b445de8cd47f24aba30dd70ef2a21d0d6dd302938a9dca370bf3e29b4adb781511ef2dabb4964493c2a2ebb5895079fb416e864843f13d731a228138')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
}
