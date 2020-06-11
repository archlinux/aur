# Maintainer: Felix Golatofski <contact@xdfr.de>

_name="django-cms"
pkgbase="python-django-cms"
pkgname=("python-django-cms")
pkgver=3.7.3
pkgrel=1
pkgdesc="An Advanced Django CMS"
url="https://django-cms.org"
arch=('any')
license=('BSD')
makedepends=("python-django" "python-django-classy-tags" "python-django-formtools" "python-treebeard" "python-django-sekizai" "python-djangocms-admin-style")
source=("$pkgname-$pkgver.tar.gz::https://github.com/divio/django-cms/archive/$pkgver.tar.gz")
sha256sums=('ed13dace9941cca10aa70a5ce980f06f6e2a30b30b2990a300dd57a329dee251')


build() {
    cd $_name-$pkgver
    python setup.py build
}

package_python-django-cms() {
    depends=("python-django" "python-django-classy-tags" "python-django-formtools" "python-treebeard" "python-django-sekizai" "python-djangocms-admin-style")

    cd $_name-$pkgver
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
