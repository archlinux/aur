# Maintainer: KokaKiwi <kokakiwi+git@kokakiwi.net>

_pkgname=mergedeep
pkgname="python-${_pkgname}"
pkgver=1.3.2
pkgrel=1
pkgdesc='A deep merge function for Python'
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9d09192e2fe4f582e14c746e0359157b07f42e702ddc0fdbbbf351f6db6ff266')
b2sums=('494a2acc535f5952e01ecf66415918dedfcb865cd6bbfcd9c94cfc7351b85d045bcc64b7b1e3ddc3fb978ba6a4a648759bf427360a6394a75cb02614f8abed8d')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
}
