# Maintainer: Fina Miñano <cicely@algofacil.info>
# Contributor: Fina Miñano <cicely@algofacil.info>
pkgname=mindi
pkgver=3.0.0
pkgrel=1
pkgdesc="Create bootable disks or CD image with your system files, to allow system maintenance"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
changelog=ChangeLog
backup=('etc/mindi/mindi.conf' 'etc/mindi/deplist.txt' 'etc/mindi/deplist.d/addon.conf')
depends=('bzip2>=0.9' 'udev>=173' 'cdrkit' 'ncurses' 'binutils' 'gawk' 'dosfstools' 'mindi-busybox>=1.7.3' 'parted' 'perl' 'mtools' 'which' 'grep>=2.5' 'cpio' 'inetutils')

# Not on all systems
#conflicts=(bonnie++)

source=(ftp://ftp.mondorescue.org/src/mindi-3.0.0.tar.gz)
md5sums=('ea734e58dc617f6d4e1f7fffb79edd6a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export DONT_RELINK=1
  export HEAD=$pkgdir
  export PREFIX=/usr
  export CONFDIR=/etc
  export DOCDIR=/usr/share/doc
  export LIBDIR=/usr/lib
  export CACHEDIR=/var/cache/$pkgname
  export PKGBUILDMINDI="true"  

# ./install.sh 
  DOCDIR_INST=${pkgdir}${DOCDIR}/${pkgname}-${pkgver}
  install -d $DOCDIR_INST
  install -m 644 ChangeLog AUTHORS COPYING README README.* TODO INSTALL NEWS $DOCDIR_INST
}

# vim:set ts=2 sw=2 et:

