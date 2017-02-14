# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=terminaltables
pkgname=python-terminaltables-git
pkgver='r131.ae22aaa'
pkgrel=1
arch=('any')
pkgdesc='Generate simple tables in terminals from a nested list of strings.'
license=('MIT')
makedepends=('git' 'python-setuptools')
provides=('python-terminaltables')
url='https://github.com/Robpol86/terminaltables'
source=("git+https://github.com/Robpol86/terminaltables.git")
sha256sums=('SKIP')

package() {
  cd "${_gitname}"

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install
  python setup.py install --optimize=1 --root="${pkgdir}"

  # Install License
  # MIT/X11 license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
