# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=think-git
_pyname=think
_gitname=think
pkgver=0.1.2.r0.ge2eaa5f
pkgrel=2
pkgdesc='Terminal Think Music (git version)'
arch=('any')
url='https://github.com/Kwpolska/think'
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=('git')
options=(!emptydirs)
provides=('think')
conflicts=('think')
source=("git://github.com/Kwpolska/${_gitname}.git")
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
