# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mime-base64-urlsafe'
pkgver='0.01'
pkgrel='1'
pkgdesc="Perl version of Python's URL-safe base64 codec"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/MIME-Base64-URLSafe'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/MIME-Base64-URLSafe-0.01.tar.gz')
md5sums=('eccf42cc7e9576dd23b9f39ad59c9b62')
sha512sums=('c1633763e1e5439af331696b11a05b16d539bf92896cdd3daa7314c3be09c73044fd254ec2562c0da4d306dd2b60e827fe0acdfacaf327b2e00ba0e242139d9a')
_distdir="MIME-Base64-URLSafe-0.01"

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
