# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=trashman-git
_pyname=trashman
_gitname=trashman
pkgver=1.5.0.r5.ga0819f
pkgrel=1
pkgdesc='A Python trash manager. (git version)'
arch=('any')
url='https://github.com/Kwpolska/trashman'
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=('git')
options=(!emptydirs)
provides=('trashman')
conflicts=('trashman')
source=("git+https://github.com/Kwpolska/${_gitname}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

# vim:set ts=2 sw=2 et:
