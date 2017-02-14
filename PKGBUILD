pkgname=perl-autodia
pkgver=2.14
pkgrel=1
_author="T/TE/TEEJAY"
_perlmod="Autodia"
pkgdesc="Autodia.pm - The configuration and Utility perl module for AutoDia"
arch=('any')
url="http://search.cpan.org/dist/perl-autodia/"
license=('GPL' 'PerlArtistic')
makedepends=(perl-xml-simple perl-template-toolkit perl-appconfig)
optdepends=(
'perl-graphviz: use graphviz to produce dot, gif, jpg or png output'
'perl-springgraph: use springgraph to produce png output'
'perl-vcg: use vcg to output postscript'
)
provides=(
perl-autodia-diagram
perl-autodia-diagram-class
perl-autodia-diagram-component
perl-autodia-diagram-dependancy
perl-autodia-diagram-inheritance
perl-autodia-diagram-object
perl-autodia-diagram-realization
perl-autodia-diagram-relation
perl-autodia-diagram-superclass
perl-autodia-handler
perl-autodia-handler-asp
perl-autodia-handler-csharp
perl-autodia-handler-cpp
perl-autodia-handler-dbi
perl-autodia-handler-dbi_sqlt
perl-autodia-handler-mason
perl-autodia-handler-php
perl-autodia-handler-perl
perl-autodia-handler-sql
perl-autodia-handler-torque
perl-autodia-handler-dia
perl-autodia-handler-python
perl-autodia-handler-umbrello
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('ac8125c88abe39d9fe01ca3acc13a00a29f3336a4bb7ef60447e6b8b822ff422')
prepare(){
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
}
build(){
  cd "$srcdir"/$_perlmod-$pkgver
  /usr/bin/perl Makefile.PL
  make
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  make test
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
