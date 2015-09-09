# Maintainer: Damien Guihal <dguihal@gmail.com>

pkgname=perl-net-sftp
pkgver=0.10
pkgrel=4
pkgdesc="Secure File Transfer Protocol client"
_dist=Net-SFTP
url="http://search.cpan.org/~dbrobins/Net-SFTP/"
#depends=('perl' 'perl-net-ssh-perl')
depends=('perl')
arch=('i686' 'x86_64')
license="Artistic License"
source=(http://www.cpan.org/authors/id/D/DB/DBROBINS/Net-SFTP-$pkgver.tar.gz)
sha256sums=('00cd1169cc50151926af96cad61f070c52d7236dd6bd996b7cc63952fb0a7de5')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

#check() {
  #cd "$srcdir/$_dist-$pkgver"
  #unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  #export PERL_MM_USE_DEFAULT=1
  #make test
#}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}


