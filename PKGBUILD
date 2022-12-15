pkgname=radicle-cli
pkgver=0.6.1
pkgrel=1
pkgdesc="Command-line tooling for Radicle"
arch=('x86_64')
url="https://github.com/radicle-dev/radicle-cli"
license=('GPL3')
provides=('rad')

source_x86_64=("https://github.com/radicle-dev/radicle-cli/releases/download/v${pkgver}/radicle-cli-x86_64-unknown-linux-musl.tar.gz")
options=(!strip)
sha256sums_x86_64=('fddcce3c24dd75026d02656eaa3b8813c40df5b8388333795e216ea4c631b7a5')

package () {
  set -o errexit
  set -o nounset
  set -o pipefail
  set -o errtrace

  dir="radicle-cli-x86_64-unknown-linux-musl"
  find "$dir" -name '*.1.gz' -type f | xargs --replace install --mode=644 --target-directory="${pkgdir}/usr/share/man/man1/" -D '{}'
  find "$dir" -type f -executable | xargs --replace install --mode=755 --target-directory="${pkgdir}/usr/bin/" -D '{}'

  set +o errexit
  set +o nounset
  set +o pipefail
  set +o errtrace
}

# vim:shiftwidth=2:expandtab:tabstop=2