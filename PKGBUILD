# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz93@gmail.com>
pkgname='python-dukpy'
pkgver=0.5.1
pkgrel=1
name=dukpy
pkgdesc="Simple JavaScript interpreter for Python"
arch=('x86_64' 'aarch64')
url="https://github.com/amol-/dukpy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("dukpy-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${name}-${pkgver}.tar.gz")
b2sums=('a5fd68cd00d3f0fd7df5acdcddc78633050203dc63239fc80f852986a0117de7f6471f8f34404552b63b73edc682122985b002635cf74548ade8e08868d1bb7e')

build() {
  cd dukpy-${pkgver}

  python setup.py build
}

package_python-dukpy() {
  cd dukpy-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-dukpy/LICENSE"
}
