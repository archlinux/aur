# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-git'
pkgver='2.052'
pkgrel='1'
pkgdesc="Update your git repository after release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-datetime>=0' 'perl-dist-zilla>=4' 'perl-dist-zilla-plugin-config-git>=0' 'perl-file-copy-recursive>=0' 'perl-file-which>=0' 'perl-file-chdir>=0' 'perl-file-pushd>=0' 'perl-git-wrapper>=0.021' 'perl-ipc-system-simple>=0' 'perl-log-dispatchouli>=0' 'perl-module-runtime>=0' 'perl-moose>=0' 'perl-path-tiny>=0.048' 'perl-string-formatter>=0' 'perl-try-tiny>=0' 'perl-type-tiny>=0' 'perl-types-path-tiny>=0' 'perl-version-next>=0' 'perl-namespace-autoclean>=0.09' 'perl>=5.010')
makedepends=()
checkdepends=('perl-dist-zilla>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Git'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Git-2.052.tar.gz')
md5sums=('297f5964a64ce4ec3fbcb2ec8930df07')
sha512sums=('533c05ab9aba8bceb6b2472230e2b8d14ed11f681dc40daebb9230359f2a14bfbdc822e73ba412998aefa1eaa6513e22d2fe4509beecf16fffc796ad10bdb4ba')
_distdir="Dist-Zilla-Plugin-Git-2.052"

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
