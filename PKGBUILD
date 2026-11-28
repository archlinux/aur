# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz93@gmail.com>
pkgname='python-dukpy'
pkgver=0.6.0
pkgrel=1
name=dukpy
pkgdesc="Simple JavaScript interpreter for Python"
arch=('x86_64' 'aarch64')
url="https://github.com/amol-/dukpy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("dukpy-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${name}-${pkgver}.tar.gz")
b2sums=('3b2ebc7ff2b352295ef8e28f7e34e05274751ca8df5e0eb7e6eaa8740beb0b6c021fca41f356e9333e7dc1c2515a944195e3ac21d5e1d572f6feb6a527de6d4d')

build() {
  cd dukpy-${pkgver}

  python setup.py build
}

package_python-dukpy() {
  cd dukpy-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-dukpy/LICENSE"
}
