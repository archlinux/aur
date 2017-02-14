# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=colorclass
pkgname=python-colorclass-git
pkgrel=1
pkgver='r137.c7ed6d7'
arch=('any')
pkgdesc='Yet another ANSI color text library for Python. '
license=('MIT')
makedepends=('git' 'python-setuptools')
provides=('python-colorclass')
url='https://github.com/Robpol86/colorclass'
source=("git+https://github.com/Robpol86/colorclass.git")
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
