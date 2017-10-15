# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-dbix-class'
pkgver='0.52'
pkgrel='1'
pkgdesc="Perl/CPAN Module Test::DBIx::Class: Easier test cases for your DBIx::Class applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-any>=0.19' 'perl-dbix-class>=0.08123' 'perl-dbix-class-schema-populatemore>=0.16' 'perl-dbix-class-timestamp>=0.13' 'perl-dbix-class-uuidcolumns>=0.02005' 'perl-data-uuid>=1.215' 'perl-data-visitor>=0.27' 'perl-hash-merge>=0.11' 'perl-list-moreutils>=0.22' 'perl-module-runtime>=0.013' 'perl-moose>=1.10' 'perl-moosex-attribute-env>=0.01' 'perl-moosex-types>=0.23' 'perl-path-class>=0.21' 'perl-sql-translator>=0.11006' 'perl-sub-exporter>=0.982' 'perl-test-deep>=0.106')
makedepends=()
url='https://metacpan.org/release/Test-DBIx-Class'
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEWELLC/Test-DBIx-Class-$pkgver.tar.gz")
md5sums=('ed5e0748198b89c947817fd67bb78193')
sha512sums=('a1c62bb85c6373c70fdcba68a65fdebb12a95f54572dc5ad4c1c6d4607229a475bfa2f28603f24744ebc72b6d0192c23b42e323d578f4d865320aee6aaf0b2fb')
_distdir="Test-DBIx-Class-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
