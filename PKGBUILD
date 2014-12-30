# Maintainer: Chris Warrick <aur@chriswarrick.com0
pkgname=trashman-git
_pyname=trashman
pkgver=1.0.4
pkgrel=1
pkgdesc='A Python trash manager.  (git version)'
arch=('any')
url='https://github.com/Kwpolska/trashman'
license=('BSD')
depends=('python')
makedepends=('git')
options=(!emptydirs)
provides=('trashman')
conflicts=('trashman')
source=("git://github.com/Kwpolska/${_gitname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
