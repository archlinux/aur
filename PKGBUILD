# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-video-framegrab'
pkgver='0.07'
pkgrel='1'
pkgdesc="Grab a frame or metadata from a video"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.47' 'perl-datetime-format-duration>=1.03' 'perl-imager>=0.7' 'perl-log-log4perl>=1.0' 'perl-sysadm-install>=0.17')
makedepends=()
url='http://search.cpan.org/dist/Video-FrameGrab'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/Video-FrameGrab-0.07.tar.gz')
md5sums=('0f6297ac0e957b911eae9a65d2f03ce2')
sha512sums=('71c3a011dd388742e917654fc169c1e06726a5d4e63e65334527ffe5518e2e6198e1843d7b862b2f46ba49216d65b2e88a1729c2a9115f847f448e276f2242f6')
_distdir="Video-FrameGrab-0.07"

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
