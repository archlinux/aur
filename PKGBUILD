# Maintainer: Kevin Azzam <aur@azz.am>

_pypiname=django_storage_swift
pkgbase=python-django-storage-swift
pkgname=('python-django-storage-swift')
pkgver=1.4.0
pkgrel=1
pkgdesc="OpenStack Swift storage backend for Django"
arch=('any')
url="https://github.com/dennisv/django-storage-swift/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://files.pythonhosted.org/packages/source/d/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('01fc7bced64dc15fc2ae28cac2dc3f8cb0de07578f997c000f84ffb0c79b5f42')


build() {
    cd "${srcdir}/${_pypiname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django' 'python-swiftclient' 'python-magic')

    cd "${srcdir}/${_pypiname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    # install -m644 "LICENSE.txt" "$pkgdir"/usr/share/licenses/$pkgname
}
