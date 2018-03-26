# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-webservice-musicbrainz
_pkgname=WebService-MusicBrainz
pkgver=1.0.4
pkgrel=1
pkgdesc="Web service API to MusicBrainz database"
arch=('any')
url="http://search.cpan.org/dist/WebService-MusicBrainz"
license=('PerlArtistic' 'GPL')
depends=('perl-class-accessor>=0.30' 'perl-uri>=1.35' 'perl-xml-libxml>=1.63' 'perl-libwww>=0' 'perl>=5.7.0' 'perl-mojolicious')
provides=('perl-webservice-musicbrainz')
conflicts=('perl-webservice-musicbrainz' 'perl-webservice-musicbrainz0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BF/BFAIST/${_pkgname}-${pkgver}.tar.gz")
md5sums=('eaa9acddf9f71040d8e9ac081e57b2b0')
sha512sums=('91442fe4696a4f9ac1434cc9dc8d3a16d2e3a8ccd3434f5e4ac642ffba0d56db6583175283c0a1a75365cdc65dbb4516bfa6182be568de16767fba3676f2368b')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
