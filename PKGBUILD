# Maintainer: user20159 <public[aT]lrose.de>

pkgbase='python-django-select2'
pkgname='python-django-select2'
pkgver=7.4.2
pkgrel=1
pkgdesc="Django integration for Select2"
url="https://github.com/codingjoe/django-select2"
#depends=('python' 'python-gym' 'python-numpy')
#optdepends=('python-matplotlib: for display')
makedepends=('python-setuptools' 'python-wheel')
license=('MIT')
arch=('any')
source=("git+https://github.com/codingjoe/django-select2/")
sha512sums=('SKIP')

#pkgver() {
#  cd "django-select2"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
    cd "${srcdir}/django-select2"
    git checkout "${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/django-select2"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
