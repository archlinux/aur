# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli'
pkgver=0.0.4
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
  'afd78f7b7defdf403ef428858150f4e3f3acbca0fc4aaf9e93a73d4885b6d431'
)

check() {
  cd "${pkgname}-${pkgver}"

  tox
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/licenses/"

  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
