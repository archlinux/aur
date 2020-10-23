# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=nxp-dlagent
pkgver=0.1.0
pkgrel=1
pkgdesc="Download agent for NXP material"
url="https://github.com/nickray/nxp-dlagent"
arch=(x86_64)
license=(Apache MIT)
makedepends=(python-pip)
depends=(python-selenium geckodriver)

source=(git+https://github.com/nickray/nxp-dlagent)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(SKIP)

package() {
  cd $srcdir/$pkgname
  # https://wiki.archlinux.org/index.php/Python_package_guidelines#pip
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
