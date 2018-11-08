# Maintainer: epitron <chris at ill-logic dot com>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Abakus <java5 at arcor dot de>
# Contributor: watashi <zejun dot wu at gmail dot com>

pkgname=afflib
pkgver=3.7.17
pkgrel=1
pkgdesc="An extensible open format for the storage of disk images and related forensic information"
arch=('i686' 'x86_64')
url="https://github.com/sshock/AFFLIBv3/"
license=('custom')
depends=('zlib' 'openssl' 'fuse')
source=("https://github.com/sshock/AFFLIBv3/archive/v${pkgver}.tar.gz")
sha256sums=('3c5a718731c90a75a1134796ab9de9a0156f6b3a8d1dec4f532e161b94bdaff4')

build() {
  cd "${srcdir}"/AFFLIBv3-${pkgver}
  sh bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/AFFLIBv3-${pkgver}
  make DESTDIR="${pkgdir}" install
}
