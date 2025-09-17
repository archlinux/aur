# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3-core'
_pkgname=${pkgname#python-}
pkgver=22.10.0
pkgrel=1
pkgdesc="Framework to ease the development of portable automated build systems"

arch=('any')
url="https://github.com/AdaCore/e3-core"
license=('GPL3')

depends=('python-colorama'
         'python-distro'
         'python-dateutil'
         'python-netifaces'
         'python-psutil'
         'python-requests'
         'python-requests-toolbelt'
         'python-stevedore>1.20.0'
         'python-tqdm'
         'python-yaml')
makedepends=('python-setuptools')
conflicts=('python2-e3-core')
makedepends=('python-pip')

source=(
  "https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/${_pkgname/-/_}-$pkgver-py3-none-any.whl"
)
sha256sums=('cf87bde4ceacf33728c43370bce2b014d88fd08c8fc4ef4167464e08334d20ac')

package() {
    cd "$srcdir" || exit
    python -m pip install --root="$pkgdir/" --no-deps --ignore-installed "${srcdir}/${source[0]##*/}"
}
