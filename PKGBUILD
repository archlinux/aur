# Maintainer: epitron <chris at ill-logic dot com>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Abakus <java5 at arcor dot de>
# Contributor: watashi <zejun dot wu at gmail dot com>

pkgname=afflib
pkgver=3.7.16
pkgrel=1
pkgdesc="is an extensible open format for the storage of disk images and related forensic information."
arch=('i686' 'x86_64')
url="https://github.com/sshock/AFFLIBv3/"


#url=http://www.sisyphus.ru/en/srpm/Sisyphus/libaff
license=('custom')
depends=('zlib' 'openssl' 'fuse')
source=(https://github.com/sshock/AFFLIBv3/archive/v${pkgver}.tar.gz)
sha256sums=(SKIP)

#prepare() {
#  cd "${srcdir}"
#  tar xvf libaff-${pkgver}.tar
#}

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
