# Maintainer: Runnytu < runnytu at gmail dot com >
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Daenyth
# Contributor: Lyle Putnam <lcputnam@amerytel.net>

pkgname=noip
pkgver=3.3.0
pkgrel=1
pkgdesc='Dynamic DNS Client Updater for no-ip.com services'
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
url='http://www.no-ip.com/downloads.php?page=linux'
license=('GPL')
install="$pkgname.install"
depends=('glibc')
source=('https://dmej8g5cpdyqd.cloudfront.net/downloads/noip-duc_3.3.0.tar.gz'
        'noip.service')
sha512sums=('5d9ef7a6bc355d55b23b52ac6b9cd7c8b95a0c8196108a3c8384fe34cc588a7e7f9b40ccf7649b2500c251707feb42fb2646a6fc2deee60d7c34fcb40734e3a8'
            '6949972af4a0b71c0f1e57230a78757b47799bbc50050ebf74893603ace6a0e959dbb4cb4523bb992d579f1369ee1e008c67f270cd6d670ad88d176485704856')

package() {
  tar xf noip-duc_3.3.0.tar.gz
  cd "$pkgname-duc_$pkgver/binaries"
  ar xf noip-duc_3.3.0_amd64.deb
  tar xf data.tar.xz
  mv usr "${pkgdir}"
  rm -fr noip-duc_3.3.0

  install -d "$pkgdir/usr/"
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/noip.service"
}

