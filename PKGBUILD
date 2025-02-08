# Maintainer: Marco Gulino <marco dot gulino at gmail dot com>
pkgname=python-xisf-fits-utils
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple command line utilities for conversion and keyword manipulation of FITS and XISF files"
arch=('any')
url="https://github.com/GuLinux/xifs-fits-python-utils"
license=('GPL3')
depends=(
  'python'
  'python-xisf'
  'python-yaml'
  'python-astropy'
)

source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b63270d24ae273e1340f9cd05b361da6aecf48ef3886e28b45eb2eb1217fe72a')


package() {
  cd "xifs-fits-python-utils-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 fits2xisf -t "$pkgdir/usr/bin/"
  install -Dm755 fits-add-keyword -t "$pkgdir/usr/bin/"
  install -Dm755 xisf-add-keyword -t "$pkgdir/usr/bin/"
  install -Dm755 xisf-metadata -t "$pkgdir/usr/bin/"
}

