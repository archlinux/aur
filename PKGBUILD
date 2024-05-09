# Maintainer: Joffrey <j-off@live.fr>

_name='djangosaml2'
pkgname='python-django-saml2'
pkgver=1.9.3
pkgrel=1
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
sha256sums=('246a81ff17942fa726437669300c4929c018e0f957600b6b48aebac52235e5c3')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
