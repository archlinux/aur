# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.40
pkgrel=1
pkgdesc="Check MANIFEST.in in a Python package for completeness"
arch=('any')
url="https://github.com/mgedmin/check-manifest"
license=('MIT')
depends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('42de6eaab4ed149e60c9b367ada54f01a3b1e4d6846784f9b9710e770ff5572c')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
