# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.1
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
makedepends=('python-pip'
             'python-wheel'
             'rustup'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/alexheretic/$pkgname/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('3e5798392c7c7e5fa87c79b3ba6fd1e3df1c4d1bc3f8f9f66cd37d46124f7e5d'
            'a21470243583122b22dd33fa959d2560a448369f6f00313dae87960b7b3cdf24')
validpgpkeys=('1D2698841A943AC5B53BF604E1355A2F8E415521')

build() {
  cd "$pkgname-$pkgver"
  ./build-dist  # build to ./target
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/"
  cp -r target/* "$pkgdir/usr/"
}
