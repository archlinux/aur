# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-doit-git
_pyname=doit
_gitname=doit
pkgver=0.28.0.r1.gdcefd21
pkgrel=1
pkgdesc='Automation Tool (git version)'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
depends=('python' 'python-pyinotify' 'python-six' 'python-setuptools')
makedepends=('git')
options=(!emptydirs)
source=("git://github.com/pydoit/${_gitname}.git"
        "LICENSE")
md5sums=('SKIP' '7d6fd7c8e022bae9010af272c31eb45f')

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
