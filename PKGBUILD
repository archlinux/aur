# Contributor: Troy Will <.com gmail AT troydwill>
pkgname=perl-moosex-followpbp
pkgver=0.05
pkgrel=1
pkgdesc='MooseX::FollowPBP - Name your accessors get_foo() and set_foo()'
_dist=MooseX-FollowPBP
_author=D/DR/DROLSKY
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-moose)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/$_author/$_dist-$pkgver.tar.gz")
md5sums=(6d62fe9be745bba23748290978f89caa)

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
