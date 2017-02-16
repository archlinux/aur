# $Id: PKGBUILD 172395 2016-04-28 09:15:47Z eworm $
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm
pkgver=1.0.5
pkgrel=2
pkgdesc='Multi-panel tabbed file manager'
arch=('i686' 'x86_64')
url='http://ignorantguru.github.com/spacefm/'
license=('GPL3')
depends=('gtk3' 'desktop-file-utils' 'startup-notification' 'ffmpegthumbnailer')
makedepends=('intltool' 'gettext')
optdepends=('lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user')
source=($pkgname-$pkgver.tar.gz::https://github.com/IgnorantGuru/spacefm/archive/$pkgver.tar.gz)
md5sums=('634763f4d3886a00088e06a4295982b2')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-pixmaps
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
