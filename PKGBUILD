# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-environ
pkgbase=python-django-environ
pkgname=('python-django-environ')
pkgver=0.4.5
pkgrel=1
pkgdesc="Django-environ allows you to utilize 12factor inspired environment variables to configure your Django application"
arch=('any')
url="https://github.com/joke2k/django-environ/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://files.pythonhosted.org/packages/source/d/django-environ/django-environ-${pkgver}.tar.gz")
sha256sums=('6c9d87660142608f63ec7d5ce5564c49b603ea8ff25da595fd6098f6dc82afde')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "LICENSE.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
