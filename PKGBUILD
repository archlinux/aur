# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
_pkgname=pygitguardian
pkgname=python-${_pkgname}
pkgver=1.3.3
pkgrel=1
pkgdesc="GitGuardian API Client."
arch=(any)
url="https://github.com/GitGuardian/py-gitguardian"
license=(MIT)
depends=('python'
         'python-marshmallow'
         'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0d14675e32a6d148c87bc997431078872ee477a8e84df5b2bfd592e5467ce37b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
