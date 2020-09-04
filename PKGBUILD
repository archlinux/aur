# Maintainer: Matthew McGinn <mamcgi@gmail.com>

_name="balena"
_module="${_name}-sdk"
_fullname="${_module}-python"
pkgname=("python-${_name}")
pkgver=10.1.1
pkgrel="1"
pkgdesc="Balena SDK for Python"
arch=("any")
url="https://github.com/balena-io/balena-sdk-python"
_github_url="https://github.com/balena-io/balena-sdk-python"
license=("Apache")
makedepends=("python-setuptools")
depends=("python-pyjwt>=1.5.0"
    "python-twisted>=18.7.0"
    "python-pyotp>=2.2.5"
    "python-pyopenssl>=18.0.0"
    "python-semver"
    "python-service-identity"
    "python-requests>=2.19.1"
)
provides=("python-${_name}")
source=("https://github.com/balena-io/${_fullname}/archive/v${pkgver}.tar.gz")
sha256sums=('2d44e19b4c66444ea1bae39e6702c2214889c8a01d0350b827ca75556fbf95e0')

build() {
    cd "${srcdir}/${_fullname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_fullname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
