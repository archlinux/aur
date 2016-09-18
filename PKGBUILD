# Maintainer: Kevin Maeder <kmaeder[AT]kevin-maeder[dot]de>

pkgname=python-django-debug-toolbar-git
_gitname=django-debug-toolbar
pkgver=1.5.r25.gef4bc2b
pkgrel=1
pkgdesc="A configurable set of panels that display various debug information about the current request/response."
arch=('i686' 'x86_64')
url="https://django-debug-toolbar.readthedocs.io/"
license=('BSD')
depends=('python' 'python-django')
conflicts=('python-django-debug-toolbar')
provides=('python-django-debug-toolbar')
makedepends=('git')
source=('git://github.com/django-debug-toolbar/django-debug-toolbar.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
      cd ${srcdir}/${_gitname}
      python setup.py install --root=${pkgdir} && \
      install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

