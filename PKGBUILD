# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=sourcekitten
pkgver=0.22.0
pkgrel=1
pkgdesc='An adorable little framework and command line tool for interacting with SourceKit..'
arch=('any')
url='https://github.com/jpsim/SourceKitten'
license=('MIT')
depends=('swift-language')
makedepends=('swift-language')
source=("https://github.com/jpsim/SourceKitten/archive/$pkgver.tar.gz"
        0001-Silence-errors-due-to-which-failing-to-find-swiftenv.patch)
sha256sums=('61f92e16c7dacd8e1389e42c5e9ccc350c73e962b7d73b7ef92608d222a744c4'
            SKIP)

prepare() {
  cd "SourceKitten-$pkgver"
  patch -p1 -i "${srcdir}/0001-Silence-errors-due-to-which-failing-to-find-swiftenv.patch"
}

package() {
  cd "SourceKitten-$pkgver"
  make install PREFIX="${pkgdir}/usr"
}
