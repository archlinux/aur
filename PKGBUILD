# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-strictyaml
_pkgname=strictyaml
pkgver=1.0.1
pkgrel=1
pkgdesc="A type-safe YAML parser that parses a restricted subset of the YAML specificaton."
arch=(any)
url="http://hitchdev.com/strictyaml/"
license=('MIT')
depends=('python' 'python-dateutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('06d7100587695a0edfabd772a6c6fb69071fc38c413df599e22dfd40e52f5fad')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
