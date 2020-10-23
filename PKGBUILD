# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=nxp-dlagent
pkgver=0.1.0
pkgrel=2
pkgdesc="Download agent for NXP material"
url="https://github.com/nickray/nxp-dlagent"
arch=(x86_64)
license=(Apache MIT)
makedepends=(python-pip)
depends=(python-selenium geckodriver)

source=(https://github.com/nickray/$pkgname/archive/$pkgver.tar.gz)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(b06d1d0b219c9981e32e832bacb3da5a4e58bde98eef62503fb5fc8ee814b56b)

package() {
  cd $srcdir/$pkgname-$pkgver
  # https://wiki.archlinux.org/index.php/Python_package_guidelines#pip
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
