# Maintainer: AruAVI <arubaanimates@gmail.com>

pkgname=clivm
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI-based Linux virtualization management tool"
arch=('any')
url="https://github.com/AruAVI/clivm"
license=('MIT')
depends=()
makedepends=()
source=("clivm-${pkgver}.tar.gz")
sha256sums=('281f030c4a605807ba8ace945ba8df7f1bbe3ffce289df6b6245a0bdf5f2b775')

package() {
  cd "$srcdir/clivm-${pkgver}"

  # Install binaries and installers under /usr/share/clivm/
  install -dm755 "$pkgdir/usr/share/clivm/binaries"
  install -dm755 "$pkgdir/usr/share/clivm/installers"

  cp -r binaries/* "$pkgdir/usr/share/clivm/binaries/"
  cp -r installers/* "$pkgdir/usr/share/clivm/installers/"

  # Install launcher to /usr/bin/clivm (executable)
  install -Dm755 clivm.py "$pkgdir/usr/bin/clivm"
}

