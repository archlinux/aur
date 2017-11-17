# Maintainer: Damien Guihal <dguihal@gmail.com>

pkgname=perl-net-sftp
pkgver=0.12
pkgrel=1
pkgdesc="Secure File Transfer Protocol client"
_dist=Net-SFTP
url="http://search.cpan.org/~dbrobins/Net-SFTP/"
license=('Artistic License')
#depends=('perl' 'perl-net-ssh-perl')
depends=('perl')
arch=('i686' 'x86_64')
source=("http://www.cpan.org/authors/id/L/LK/LKINLEY/Net-SFTP-$pkgver.tar.gz")
sha256sums=('828e676ee35499127a47f3f3e5828d7f87d1b88eb55da3be2ab8dbdd83804f18')

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


