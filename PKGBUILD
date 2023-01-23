# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Dominik Schrempf <dominik.schrempf at gmail dot com>
# Contributor: Jonathan Ryan <jryan at curious-computing dot com>
# Contributor: Hussam Al-Tayeb <hussam at visp dot net dot lb>

pkgname=htpdate
pkgver=1.3.7
pkgrel=1
pkgdesc="HTTP Time protocol"
arch=('i686' 'x86_64')
url="https://github.com/twekkel/htpdate"
license=(GPL2)
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "htpdate.service")
sha256sums=('88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2'
  '2f12bdf0745fbf7c52f465e78b47635fbdc6fa372e63fb94a6063a5f67ff8c8b')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  install -D -m644 htpdate.service ${pkgdir}/usr/lib/systemd/system/htpdate.service
  cd ${pkgname}-${pkgver}
  install -D -m755 htpdate ${pkgdir}/usr/bin/htpdate
  install -D -m644 htpdate.8 ${pkgdir}/usr/share/man/man8/htpdate.8
}
