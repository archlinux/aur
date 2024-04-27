# Maintainer: Runnytu < runnytu at gmail dot com >
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Daenyth
# Contributor: Lyle Putnam <lcputnam@amerytel.net>

pkgname=noip
pkgver=3.1.0
pkgrel=1
pkgdesc='Dynamic DNS Client Updater for no-ip.com services'
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
url='http://www.no-ip.com/downloads.php?page=linux'
license=('GPL')
install="$pkgname.install"
depends=('glibc')
source=('https://dmej8g5cpdyqd.cloudfront.net/downloads/noip-duc_3.1.0.tar.gz'
        'noip.service')
sha512sums=('e35391ef9e5e41f22ab143e1ccf27523cd3dcad24c581ae0537055f3008a54bf48fbcc6e2d614c977ace04f2a021b8c748f3821840a8efa145f6fbbcf7719df7'
            '6949972af4a0b71c0f1e57230a78757b47799bbc50050ebf74893603ace6a0e959dbb4cb4523bb992d579f1369ee1e008c67f270cd6d670ad88d176485704856')

package() {
  tar xf noip-duc_3.1.0.tar.gz
  cd "$pkgname-duc_$pkgver/binaries"
  ar xf noip-duc_3.1.0_amd64.deb
  tar xf data.tar.xz
  mv usr "${pkgdir}"
  rm -fr noip-duc_3.1.0

  install -d "$pkgdir/usr/"
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/noip.service"
}

