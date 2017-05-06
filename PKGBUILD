# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.5
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
sha256sums=('4b8cde9559d19d4e23fa7f1d37a11fe8cb83baba18fac68c9ba5ed8f3ef87073')

build() {
  cd "$pkgname-$pkgver"
  ./build-dist  # build to ./target
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/"
  cp -r target/* "$pkgdir/usr/"
}
