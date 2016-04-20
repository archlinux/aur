# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
pkgname=kingfisherqm
pkgver=0.0.3
pkgrel=5
pkgdesc="Backend for Cups - count correct pages and administration"
arch=('i686' 'x86_64')
license=('GPL')
backup=('etc/kingfisher/kingfisher.conf')
url="http://sourceforge.net/projects/kingfisherqm/"
depends=("postgresql" "postgresql-libs" "cups" "php" "php-apache" "apache" "perl" "perl-proc-daemon" "perl-proc-pid-file" "perl-dbd-pg" "perl-ipc-shareable" "perl-gdgraph" "perl-gd-graph3d" "python" "pkpgcounter")
options=('!makeflags')
install='kingfisher.install'
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download" kingfisher.install)
md5sums=('9849252841240d87e89196060b9054e2'
	 'ab1c8d8acf5cc8094b49def4953fac6d') 

package() {
  cd $srcdir
  bsdtar xf "$SRCDEST/download"

  # Copy others files
  mv $startdir/src/${pkgname}/etc/init.d $startdir/src/${pkgname}/etc/rc.d
  cp -R $startdir/src/${pkgname}/etc $startdir/src/${pkgname}/usr $startdir/pkg

  # Creating directory /var/spool/kingfisher
  mkdir -p $startdir/pkg/var/spool/kingfisher
  chmod -R 0777 $startdir/pkg/var/spool/kingfisher
}
