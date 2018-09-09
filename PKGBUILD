# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-strictyaml
_pkgname=strictyaml
pkgver=0.11.10
pkgrel=1
pkgdesc="A type-safe YAML parser that parses a restricted subset of the YAML specificaton."
arch=(any)
url="http://hitchdev.com/strictyaml/"
license=('MIT')
depends=('python' 'python-dateutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e3a81f7e326b832d68e533c83fea0b3840387fb4924008e60860a32d9c387e7a')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
