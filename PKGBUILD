# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.4
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
sha256sums=('eb15644c6140c2bbca22f9f8d20580619f03175a68c2680bb88223df5a839cc2')

build() {
  cd "$pkgname-$pkgver"
  ./build-dist  # build to ./target
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/"
  cp -r target/* "$pkgdir/usr/"
}
