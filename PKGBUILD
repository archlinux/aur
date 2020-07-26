# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-click-spinner
_pkgname=click-spinner
pkgver=0.1.10
pkgrel=1
pkgdesc="Spinner for Click"
arch=("any")
url="https://github.com/click-contrib/click-spinner"
license=('MIT')
depends=('python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE")
sha256sums=('87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf'
            '5a6c9188bff3c34c09dce216996d2c99fc9ea8c1baea3a6903b893d979ac721e')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
