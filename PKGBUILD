# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-pcap-easy'
pkgver='1.4207'
pkgrel='1'
pkgdesc="Net::Pcap is awesome, but it's difficult to bootstrap"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1' 'perl-file-slurp' 'perl-net-netmask' 'perl-net-pcap' 'perl-netpacket')
makedepends=()
url='http://search.cpan.org/dist/Net-Pcap-Easy'
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JETTERO/Net-Pcap-Easy-1.4207.tar.gz')
md5sums=('4baf443c329c8246ad1f85f6d0de9a5d')
sha512sums=('51a109272788f7942e749cd709bbe986c803829ae0423954c239b65c245e1c4c4dd774752b60d0a4f53762e4f0b6df3848060f886bd6202b7db546e1e9354ec0')
_distdir="Net-Pcap-Easy-1.4207"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
