# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-mention'
pkgver='0.704'
pkgrel='1'
pkgdesc="Implementation of the IndieWeb Webmention protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0' 'perl-datetime-format-iso8601>=0' 'perl-http-link>=0' 'perl-json>=0' 'perl-lwp-protocol-https>=0' 'perl-mojo-dom58>=0' 'perl-moose>=0' 'perl-moosex-classattribute>=0' 'perl-moosex-enumeration>=0' 'perl-moosex-types-uri>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-string-truncate>=0' 'perl-try-tiny>=0' 'perl-type-tiny>=0' 'perl-uri>=0' 'perl-web-microformats2>=0.5' 'perl-libwww>=0' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-lwp-useragent>=0' 'perl-test-warn>=0')
url='https://metacpan.org/release/Web-Mention'
source=('https://cpan.metacpan.org/authors/id/J/JM/JMAC/Web-Mention-0.704.tar.gz')
md5sums=('f3e47437a6c1eaa2f81d9f1e8dd2fac5')
sha512sums=('fef82925fa3efafcbbf25b74d01df98e86b175f20b1bb04bdfd04316ca6cf1c5986ef461353b07e3e092188c4d2cd20d0ced2f8f646f43645cffa3148fc2a689')
_distdir="Web-Mention-0.704"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
