# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-mention'
pkgver='0.720'
pkgrel='1'
pkgdesc="Implementation of the IndieWeb Webmention protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0' 'perl-datetime-format-iso8601>=0' 'perl-http-link>=0' 'perl-json>=0' 'perl-lwp-protocol-https>=0' 'perl-mojo-dom58>=0' 'perl-moo>=0' 'perl-moox-classattribute>=0' 'perl-moox-enumeration>=0' 'perl-moox-handlesvia>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-string-truncate>=0' 'perl-try-tiny>=0' 'perl-type-tiny>=0' 'perl-uri>=0' 'perl-web-microformats2>=0.5' 'perl-libwww>=0' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-lwp-useragent>=0' 'perl-test-warn>=0')
url='https://metacpan.org/release/Web-Mention'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMAC/Web-Mention-0.720.tar.gz')
md5sums=('468fb6cac4b61cc66e3ee17c863a4f01')
sha512sums=('f3728e9ab0a9e01b03f33a6e596756de5efce575cc68616174aae85cb1173836cb143609cd0810872fc3e542cd931dc90de03f5af2bb6e36bb84abe381405bc5')
_distdir="Web-Mention-0.720"

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
