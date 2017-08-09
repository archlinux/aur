# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli'
pkgver=0.0.2
pkgrel=1
pkgdesc='stratis-cli is a tool that provides a command-line interface (CLI) for interacting with the Stratis daemon, stratisd.'
arch=('any')
license=('apache2')
url='stratis-storage.github.io'
depends=('python-argparse')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratis-cli/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'fadf5026b805b77f6067c133f6283e05f6e9288604ba094f2127171cfa52cd9e'
)

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/licenses/"

  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/"
  python setup.py install --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
