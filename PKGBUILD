# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-readmefrompod'
pkgver='0.40'
pkgrel='1'
pkgdesc="dzil plugin to generate README from POD"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=6.000' 'perl-io-string>=0' 'perl-moose>=0' 'perl-path-tiny>=0.004' 'perl-pod-readme>=1.2.0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Dist-Zilla-Plugin-ReadmeFromPod'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Dist-Zilla-Plugin-ReadmeFromPod-0.40.tar.gz')
md5sums=('32849c89ecb9ebeec214d1107752e990')
sha512sums=('7c5a9f283db91d52aa36e1429176d51686c57110eb33bb13cbe94afc915904ae92d4996344d95aef968d0d13fcecb523eef80cf291915ef0f768178e9573fc3c')
_distdir="Dist-Zilla-Plugin-ReadmeFromPod-0.40"

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
