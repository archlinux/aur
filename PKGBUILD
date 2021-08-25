# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-django-hosts-git
pkgver=4.0.r10.g55634e5
pkgrel=1
pkgdesc="Dynamic and static host resolving for Django. Maps hostnames to URLconfs"
arch=(any)
url="http://django-hosts.rtfd.org/"
license=('BSD')
depends=('python' 'python-django' 'python-django-debug-toolbar')
makedepends=('git' 'python-setuptools-scm')
provides=('python-django-hosts')
conflicts=('python-django-hosts')

source=("git+https://github.com/jazzband/django-hosts")
sha256sums=('SKIP')

pkgver() {
    cd django-hosts
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd django-hosts
    python setup.py build
}

package() {
    cd django-hosts
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
