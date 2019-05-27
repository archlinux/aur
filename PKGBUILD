# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=sphinx-confluence
pkgname=python-${_pkgname}-git
pkgver=v0.0.3.10.g8c44bc9
pkgrel=2
pkgdesc='Atlassian Confluence extension for sphinx.'
url="https://github.com/Arello-Mobile/${_pkgname}"
arch=('any')
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python-sphinx' 'python-docutils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/-/./g'
}

check() {
  cd "${srcdir}/${_pkgname}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
