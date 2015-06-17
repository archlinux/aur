#Maintainer: M0Rf30

pkgname=airpwn-git
pkgver=10.cf2ac0e
pkgrel=1
pkgdesc="A generic packet injection tool for 802.11 networks."
arch=('i686' 'x86_64')
url="http://airpwn.sourceforge.net"
license=('GPL2')
depends=('pcre' 'libpcap' 'openssl' 'libnet' 'python2' 'lorcon-old-git')
makedepends=('git')
optdepends=('net-tools: to put wireless interfaces into monitor mode'
            'iw: for mac80211 monitor-mode support'
            'madwifi-utils: for madwifi monitor-mode support')
options=('!libtool')
md5sums=('SKIP')
source=('airpwn::git://github.com/M0Rf30/airpwn.git')

build() {
  cd airpwn
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd airpwn
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd airpwn
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
