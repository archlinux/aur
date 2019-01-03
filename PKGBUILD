# Maintainer: Matthew Pfeiffer (spferical@gmail.com)
pkgname=visram-git
_pyname=visram
pkgver=r134.efc7012
pkgrel=1
pkgdesc='Graphical RAM usage visualizer (git version)'
arch=('any')
url='https://github.com/Spferical/visram/'
license=('MIT')
depends=('python' 'python-matplotlib' 'python-psutil' 'python-pyqt5')
makedepends=('git')
source=('git+https://github.com/Spferical/visram.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pyname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${_pyname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
  install -D -m644 xdg/${_pyname}.desktop "${pkgdir}/usr/share/applications/${_pyname}.desktop"
}

# vim:set ts=2 sw=2 et:
