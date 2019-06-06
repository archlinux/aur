# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.39
pkgrel=1
pkgdesc="Check MANIFEST.in in a Python package for completeness"
arch=('any')
url="https://github.com/mgedmin/check-manifest"
license=('MIT')
depends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a4c555f658a7c135b8a22bd26c2e55cfaf5876e4d5962d8c25652f2addd556bc')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
