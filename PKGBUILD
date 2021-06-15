# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-django-bootstrap-breadcrumbs-git"
pkgver=0.9.2.r0.gaeb0c82
pkgrel=1
pkgdesc="Django template tags for easy breadcrumbs using twitter bootstrap css classes or custom template"
url="https://github.com/prymitive/bootstrap-breadcrumbs/"
license=("MIT")
arch=("any")
provides=("python-django-bootstrap-breadcrumbs")
depends=("python-django")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "bootstrap-breadcrumbs"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "bootstrap-breadcrumbs"
 python setup.py build
}

package(){
 cd "bootstrap-breadcrumbs"
 python setup.py install --root="$pkgdir" --optimize=1
}
