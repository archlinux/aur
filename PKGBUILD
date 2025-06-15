# Maintainer: AruAVI <arubaanimates@gmail.com>

pkgname=clivm
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI-based Linux virtualization management tool"
arch=('any')
url="https://github.com/AruAVI/clivm"
license=('MIT')
depends=('debootstrap' 'arch-install-scripts' 'wget' 'git')
makedepends=()
source=("clivm-${pkgver}.tar.gz")
sha256sums=('d3ffb8082c1531a950c3b174571213d4d8b7ebc841b22939e89659deec8f5a6f')

package() {
  cd "$srcdir/clivm-$pkgver"

  # Install binaries and installers under /usr/share/clivm/
  install -dm755 "$pkgdir/usr/share/clivm/binaries"
  install -dm755 "$pkgdir/usr/share/clivm/installers"

  cp -r binaries/* "$pkgdir/usr/share/clivm/binaries/"
  cp -r installers/* "$pkgdir/usr/share/clivm/installers/"

  # Install launcher to /usr/bin/clivm (executable)
  install -Dm755 clivm.py "$pkgdir/usr/bin/clivm"
}
