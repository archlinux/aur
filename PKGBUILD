# Maintainer: gee

pkgname=python2-czipfile
pkgver=1.0.0
pkgrel=1
pkgdesc='czipfile is a faster replacement for Python’s builtin “zipfile” module'
url='https://github.com/V-E-O/czipfile'
arch=('x86_64')
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=(git+https://github.com/V-E-O/czipfile.git)
sha512sums=(SKIP)

build() {
  cd czipfile
  python2 setup.py build
}

package() {
  cd czipfile
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
