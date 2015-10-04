# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Abakus <java5 at arcor dot de>
# Contributor: watashi <zejun dot wu at gmail dot com>

pkgname=afflib
pkgver=3.7.4
pkgrel=1
pkgdesc="is an extensible open format for the storage of disk images and related forensic information."
arch=('i686' 'x86_64')
url="https://github.com/simsong/AFFLIBv3/releases"
#url=http://www.sisyphus.ru/en/srpm/Sisyphus/libaff
license=('custom')
depends=('zlib' 'openssl' 'fuse')
#source=("ftp://ftp.altlinux.org/pub/distributions/ALTLinux/Sisyphus/files/SRPMS//libaff-${pkgver}-alt1.src.rpm")
source=(https://github.com/simsong/AFFLIBv3/archive/v${pkgver}.tar.gz)
md5sums=('a81470590cfc2f22a3168f89ebe27ea6')

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
