# CPAN Name  : IPC::PubSub
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-ipc-pubsub
pkgver=0.29
pkgrel=2
pkgdesc="Perl module providing a simple API for publishing messages to channels and for subscribing to them"
arch=("any")
url="https://metacpan.org/release/IPC-PubSub"
license=("MIT")
depends=("perl>=5.6.0" "perl-data-uuid" "perl-dbm-deep>=1.00" "perl-class-accessor")
source=(http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/IPC-PubSub-0.29.tar.gz)
options=(!emptydirs)
md5sums=("e10d5732307982eff46a4223f05d104f")

build() {
  cd "$srcdir/IPC-PubSub-0.29"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/IPC-PubSub-0.29"
  make test
}

package() {
  cd "$srcdir/IPC-PubSub-0.29"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
