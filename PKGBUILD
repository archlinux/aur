# Maintainer: Matthew McGinn <mamcgi@gmail.com>

_name="balena"
_module="${_name}-sdk"
_fullname="${_module}-python"
pkgname=("python-${_name}")
pkgver=9.4.1
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
sha256sums=('4dce8d4a4412ac6c087ab0f9d86d410f0da6cb2f642923df512f3523fc9eca60')

build() {
    cd "${srcdir}/${_fullname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_fullname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
