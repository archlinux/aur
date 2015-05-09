# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: xekarfwtos <xekarfwtos@gmail.com>
# Contributor: BartÅ‚omiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: jnbek <nospam@noemail.ru>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm-gtk2
_pkgname=spacefm
pkgver=1.0.1
pkgrel=1
pkgdesc='Multi-panel tabbed file manager'
arch=('i686' 'x86_64')
url='http://ignorantguru.github.com/spacefm/'
license=('GPL3')
conflicts=('spacefm')
provides=('spacefm')
install=$_pkgname.install
depends=('gtk2' 'desktop-file-utils' 'startup-notification' 'ffmpegthumbnailer')
makedepends=('intltool' 'gettext')
optdepends=('lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user')
source=($_pkgname-$pkgver.tar.gz::https://github.com/IgnorantGuru/spacefm/archive/$pkgver.tar.gz)
md5sums=('3665b0cf08dcbebefcc832afc19d613e')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-pixmaps --with-gtk2
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
