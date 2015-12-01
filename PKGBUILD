# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.29
pkgrel=2
pkgdesc="Check MANIFEST.in in a Python package for completeness"
arch=(any)
url="https://github.com/mgedmin/check-manifest"
license=('MIT')
depends=('python-setuptools')
source=("https://pypi.python.org/packages/source/c/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0b7fbdcbc6311728b0dd24d07c9aff83c62394698b43c3bb59bd7af9880b7676')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENCE.rst "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
