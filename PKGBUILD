# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: github
# what: pymumu/smartdns
# prefix! Release

pkgname=smartdns-plugin-ui
pkgver=48.3
pkgrel=1
pkgdesc="Dashboard UI plugin for smartdns"
arch=('x86_64')
license=('GPL')
url="https://github.com/pymumu/smartdns"
depends=("smartdns=$pkgver" 'smartdns-webui')
makedepends=('git' 'rust' 'rust-bindgen')
source=("git+https://github.com/pymumu/smartdns.git#tag=Release$pkgver")
sha512sums=('0ef770b9580fd2bccfe8bbbff695138ad3d773206f06393d5e7fbc9e48c91924e2d74a8d002f6b1d517cf52b01a7c02277086e3ed98a4657a16f2a51def092c0')

build() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin
}

package() {
  cd smartdns
  make -C plugin/smartdns-ui RUNSTATEDIR=/run SBINDIR=/usr/bin DESTDIR="$pkgdir" install
}
