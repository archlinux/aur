# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
_pkgname="${pkgname#python-}"
pkgver=1.2.1
pkgrel=1
pkgdesc="Binary diff and patch using the BSDIFF4-format"
url="https://github.com/ilanschnell/${_pkgname}"
depends=('python')
license=('BSD')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ilanschnell/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('927e162988866e9fe0dae1b0030db8bf849f5cb0de46e6d5f1a6f404a2df79174babcd13a31f401c16c5d349737d44bd801bb4218511b36dd217f4aae69c1b5d')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

