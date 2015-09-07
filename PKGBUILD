# Maintainer: Samuel Littley <aur@toastwaffle.com>
# Contributor:  Haoyu Bai <baihaoyu@gmail.com>
pkgname=perl-net-google-authsub
pkgver=0.5
pkgrel=3
pkgdesc="Perl/CPAN module Net::Google::AuthSub"
url="http://search.cpan.org/~simonw/Net-Google-AuthSub/"
depends=('perl-libwww')
license="GPL"
options=('!emptydirs')
arch=('any')
source=(http://search.cpan.org/CPAN/authors/id/S/SI/SIMONW/Net-Google-AuthSub-$pkgver.tar.gz)
md5sums=('edd1363bd9db1e96d2cd2d4893d62537')

build() {
  cd $startdir/src/Net-Google-AuthSub-$pkgver
  eval `perl -V:archname`
  /usr/bin/perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  make
}

package() {
  cd $startdir/src/Net-Google-AuthSub-$pkgver
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
