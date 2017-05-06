# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.3
pkgrel=1
pkgdesc="Linux GUI for cloning/restoring partitions to/from compressed image files"
arch=('any')
url="https://github.com/alexheretic/apart-gtk"
license=('GPL3')
depends=('python'
         'python-gobject'
         'gtk3'
         'pigz'
         'partclone'
         'zeromq')
optdepends=('polkit: to run as non-root user')
makedepends=('python-pip'
             'python-wheel'
             'rustup'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fb28a73cef0057ea77f493eae744de130d04c886555fe3d84b38064098527d8d')

build() {
  cd "$pkgname-$pkgver"
  ./build-dist  # build to ./target
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/"
  cp -r target/* "$pkgdir/usr/"
}
