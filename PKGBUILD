# Maintainer: seppovic <markus at da-weber dot de>

pkgname=python-micropy-cli
_pkgname=${pkgname#python-}
pkgver=3.5.0
pkgrel=1
pkgdesc="A project management/generation tool for writing Micropython code in modern IDEs."
arch=('any')
url="https://github.com/BradenM/micropy-cli"
license=('MIT')
depends=('python' 'python-setuptools' 'python-boltons' 'python-click' 'python-colorama' 'python-jsonschema' 'python-dpath' 'python-gitpython' 'python-packaging' 'python-questionary' 'python-requests' 'python-requirements-parser' 'python-tqdm')
# missing - jinja2, cachier
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha512sums=('68b140fc0ca69f5fd00ac29021840c5cb88a7513e51e1f139f7425b83d6d6dd65680e63811506ab7b4c512e919575044794042de413716bd14914f1ade4092de')
sha256sums=('2414b42299ff118be7001620581654495e886676373b030a49767d18687a21de')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
