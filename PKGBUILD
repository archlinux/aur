# Maintainer: xekarfwtos <xekarfwtos@gmail.com>
# Contributor: BartÅ‚omiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: jnbek <nospam@noemail.ru>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm-gtk2
_pkgname=spacefm
pkgver=0.9.4
pkgrel=1
pkgdesc='Multi-panel tabbed file manager'
arch=('i686' 'x86_64')
url='http://ignorantguru.github.com/spacefm/'
license=('GPL3')
conflicts=('spacefm')
provides=('spacefm')
install=$_pkgname.install
depends=('gtk2' 'shared-mime-info' 'desktop-file-utils' 'startup-notification'
         'udev' 'bash')
makedepends=('intltool' 'gettext')
optdepends=('lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks: mount as non-root user'
            'udisks2: mount as non-root user')
source=(https://github.com/IgnorantGuru/spacefm/archive/$pkgver.tar.gz)
md5sums=('daeee7dcccea33d6258a0a9d783470c4')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-pixmaps
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
