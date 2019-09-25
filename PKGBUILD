# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=sphinxcontrib-golangdomain
pkgname=python-${_pkgname}-git
pkgver=r38.85fe9cc
pkgrel=1
pkgdesc='This is the Go-lang domain for Sphinx 1.0+.'
url="https://bitbucket.org/SilverRainZ/${_pkgname}"
arch=('any')
license=('BSD')
makedepends=('git' 'python-setuptools')
depends=('python-sphinx')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "${srcdir}/${_pkgname}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
