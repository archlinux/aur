# Maintainer: Marco Gulino <marco dot gulino at gmail dot com>
pkgname=python-xisf-fits-utils
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple command line utilities for conversion and keyword manipulation of FITS and XISF files"
arch=('any')
url="https://github.com/GuLinux/xifs-fits-python-utils"
license=('GPL3')
sha256sums=('424db6b86095d286c740be6e9cb2762170a9eae142fc6f9f493d1e17cb3c615a')
depends=(
  'python'
  'python-xisf'
  'python-yaml'
  'python-astropy'
)

source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

package() {
  cd "xifs-fits-python-utils-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 fits2xisf -t "$pkgdir/usr/bin/"
  install -Dm755 fits-add-keyword -t "$pkgdir/usr/bin/"
  install -Dm755 xisf-add-keyword -t "$pkgdir/usr/bin/"
  install -Dm755 xisf-metadata -t "$pkgdir/usr/bin/"
  install -Dm755 xisf-keyword-stats -t "$pkgdir/usr/bin/"
  install -Dm755 xisf-temp-stats -t "$pkgdir/usr/bin/"
}

