# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.20
pkgrel=1
pkgdesc="Tool to check the completeness of MANIFEST.in for Python packages."
arch=(any)
url="https://github.com/mgedmin/check-manifest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/mgedmin/check-manifest/archive/${pkgver}.tar.gz")
sha1sums=('a1f3e0483189eee33e70a3c350444d5384710ab3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENCE.rst "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
