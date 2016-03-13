# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name=pyquante2
pkgname=(python-${_name}-git python2-${_name}-git)
pkgver=r469.91a352b
pkgrel=1
pkgdesc="Python Quantum Chemistry Reloaded. This is a rewrite of the standard PyQuante program to clean up things that have been nagging me."
arch=("i686" "x86_64")
url="https://github.com/rpmuller/${_name}"
license=("BSD")
depends=("python" "python2" "python-numpy" "python2-numpy" "cython" "cython2")
makedepends=("git")
provides=("python-pyquante2" "python2-pyquante2")
conflicts=("python-pyquante2" "python2-pyquante2")
source=("git+https://github.com/rpmuller/${_name}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

package_python-pyquante2-git() {
  depends=("python" "python-numpy" "cython")
  provides=("python-pyquante2")
  conflicts=("python-pyquante2")

  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pyquante2-git() {
  depends=("python2" "python2-numpy" "cython2")
  provides=("python2-pyquante2")
  conflicts=("python2-pyquante2")

  cd "${srcdir}/${_name}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
