# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli-git'
_gitname='stratis-cli'
pkgver=v0.0.2.r3.gbf0beb6
pkgrel=1
pkgdesc='???'
arch=('any')
license=('apache2')
url='https://github.com/stratis-storage/stratis-cli.git'
depends=('python-argparse')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=(
  'git+https://github.com/stratis-storage/stratis-cli.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${_gitname}"

  git describe --tags --long \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"

  install -d "${pkgdir}/usr/share/licenses/"

  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/"
  python setup.py install --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
