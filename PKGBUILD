# Contributor: Charles Leifer
# Maintainer: Sol Bekic <s0lll0s at blinkenshell dot org>

_gitname=themer
_gitbranch=master
pkgname="python-${_gitname}-git"
pkgdesc='Themer is a colorscheme generator and manager for your desktop.'
pkgrel=2
url="https://github.com/s0lll0s/${_gitname}"
license=('MIT')
arch=('any')
depends=('python' 'python-pillow' 'python-yaml' 'python-jinja' 'python-requests')
optdepends=('i3: default-supported windowmanager' 'fish: supports completion')
makedepends=('git' 'python-setuptools')
conflicts=()
install="${_gitname}.install"
source=("${_gitname}::git://github.com/s0lll0s/${_gitname}.git#branch=${_gitbranch}"
        "${install}")
sha256sums=('SKIP'
            '3fc9aa9b92cbb7dbbc0b30323faf3744c30abb7d6d365331a5b8a623355987a5')

pkgver() {
  cd "${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
