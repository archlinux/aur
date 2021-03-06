# Maintainer: MrDogeBro <MrDogeBro@users.noreply.github.com>

set -u
pkgname=quicknav
pkgver=0.1.0
pkgrel=1
pkgdesc="A way to quickly navigate your filesystem from the command line."
url="https://github.com/MrDogeBro/quicknav"
license=("MIT")
arch=("any")
depends=("rust")
source=("${pkgname}.tgz::https://github.com/MrDogeBro/quicknav/archive/v${pkgver}.tar.gz")
sha256sums=("f6626af4f1fcd7b791b8d7806ed8dd8489062eae2984352ee19b3e1d0466880c")

package() {
  set -u
  cd ${srcdir}/${pkgname}-${pkgver}
  cargo build --release
  install -Dm755 target/release/quicknav -t "$pkgdir/usr/bin/quicknav"

  set +u
}
set +u
