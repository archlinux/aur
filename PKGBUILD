# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-storage-swift
pkgbase=python-django-storage-swift
pkgname=('python-django-storage-swift')
pkgver=1.2.17
pkgrel=1
pkgdesc="OpenStack Swift storage backend for Django"
arch=('any')
url="https://github.com/dennisv/django-storage-swift/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://files.pythonhosted.org/packages/source/d/django-storage-swift/django-storage-swift-${pkgver}.tar.gz")
sha256sums=('6a51ebd39ca6dcfdbdabbc70e8842da9ed8db59dfe03b914aabdc2922bd2dd61')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django' 'python-swiftclient' 'python-magic')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    # install -m644 "LICENSE.txt" "$pkgdir"/usr/share/licenses/$pkgname
}
