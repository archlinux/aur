# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname=python-kivymd-git
pkgver=0.104.1.r13.g513f016
pkgrel=1
pkgdesc="KivyMD is a collection of Material Design compliant widgets for use with Kivy, a framework for cross-platform, touch-enabled graphical applications."
arch=('any')
url="https://github.com/HeaTTheatR/KivyMD/"
license=('MIT')
conflicts=('python-kivymd')
provides=('python-kivymd')
makedepends=('python-setuptools')
source=("${pkgname}::git+https://github.com/HeaTTheatR/KivyMD.git")
md5sums=('SKIP')

pkgver(){
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
