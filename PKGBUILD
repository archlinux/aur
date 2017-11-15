# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-environ
pkgbase=python-django-environ
pkgname=('python-django-environ')
pkgver=0.4.4
pkgrel=1
pkgdesc="Django-environ allows you to utilize 12factor inspired environment variables to configure your Django application"
arch=('any')
url="https://github.com/joke2k/django-environ/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://files.pythonhosted.org/packages/source/d/django-environ/django-environ-${pkgver}.tar.gz")
sha256sums=('ee2f8405d83137e3328b26b3de01bd715b5395fca22feb919dcc905fb6099cfa')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "LICENSE.txt" "$pkgdir"/usr/share/licenses/$pkgname
}
