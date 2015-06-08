# Contributor:  Haoyu Bai <baihaoyu@gmail.com>
pkgname=perl-net-google-authsub
pkgver=0.5
pkgrel=2
pkgdesc="Perl/CPAN module Net::Google::AuthSub"
url="http://search.cpan.org/~simonw/Net-Google-AuthSub/"
depends=('perl-libwww')
license="GPL"
options=('!emptydirs')
arch=('any')
source=(http://search.cpan.org/CPAN/authors/id/S/SI/SIMONW/Net-Google-AuthSub-$pkgver.tar.gz)
md5sums=('edd1363bd9db1e96d2cd2d4893d62537')

build() {
  cd  $startdir/src/Net-Google-AuthSub-$pkgver
  eval `perl -V:archname`
  /usr/bin/perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}
