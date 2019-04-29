# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=python-lcdproc-git
pkgver=r23.0cb8028
pkgrel=1
pkgdesc="Python OOP Wrapper Library for LCDproc Telnet API"
arch=('any')
url="https://github.com/adicarlo/Python-lcdproc"
license=('BSD')
makedepends=('python-pip')
depends=('python')
provides=('python-lcdproc')
options=(!emptydirs)
source=("${pkgname}::git+https://github.com/adicarlo/Python-lcdproc.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
