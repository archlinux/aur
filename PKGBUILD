# Maintainer: Joffrey <j-off@live.fr>

_name='djangosaml2'
pkgname='python-django-saml2'
pkgver=1.9.2
pkgrel=2
pkgdesc='A Django application that builds a Fully Compliant SAML2 Service Provider'
arch=('any')
url="https://github.com/IdentityPython/$_name"
license=('Apache')
depends=('python-django' 'python-pysaml2')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c1dc5573cba1ab16a4bed5fd5e619d0d6605a79a434fda4ce3c8429e3cf033e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
