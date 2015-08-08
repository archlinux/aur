# Contributor: andmars <andreas.marschall @ unitybox.de>
pkgname=perl-musicbrainz-discid
pkgver=0.03
pkgrel=1
pkgdesc='This packages the MusicBrainz-DiscID distribution, containing the MusicBrainz::DiscID module!'
_dist=MusicBrainz-DiscID
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'libdiscid')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/N/NJ/NJH/$_dist-$pkgver.tar.gz")
md5sums=('4b775f38604f15fd20298d5b443d6900')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
}
