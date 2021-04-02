# Maintainer: Joe Balough <scallopedllama@gmail.com>
pkgname=easel-driver
pkgver=0.3.20
pkgrel=1
pkgdesc="Driver used to communicate between Easel and X-Carve or Carvey"
arch=('x86_64')
url="https://easel.inventables.com/downloads"
license=('unknown')
install='install.sh'
source=(https://s3.amazonaws.com/easel-prod/paperclip/sender_version_linux_installers/46/original/EaselDriver-$pkgver-x64.deb)
noextract=()
md5sums=('bb32b33b2c446efcc31cb50f75504e2c')

prepare() {
    rm -rf "$srcdir/root"
    mkdir "$srcdir/root"
	cd "$srcdir/root"
	tar -xf ../data.tar.xz
}

package() {
	cd "$srcdir/root"
	cp -rfv * "$pkgdir/"
}
