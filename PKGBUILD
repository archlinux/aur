# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.35
pkgrel=1
pkgdesc="Check MANIFEST.in in a Python package for completeness"
arch=('any')
url="https://github.com/mgedmin/check-manifest"
license=('MIT')
depends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f9b7a3a6071f1991009bfa760f903b6d31f7b852a35d76a1cbbbcd1b22c9f44a')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
