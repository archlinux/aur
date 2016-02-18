# Maintainer: Peter Pickford <arch@netremedies.ca>
# Contributor: Peter Pickford <arch@netremedies.ca>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=S/SE/SETHJ
_perlmod=Audio-DSP
_oldver=0.02
pkgname=perl-audio-dsp
pkgver=0.03
pkgrel=1
pkgdesc='Audio::DSP is built around the OSS (Open Sound System) API and allows
    perl to interface with a digital audio device. The Audio::DSP object
    stores I/O parameters and also supplies temporary storage for raw
    audio data.'
arch=('any')
url="http://search.cpan.org/~sethj/Audio-DSP"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl
)
makedepends=(
perl
)
optdepends=()
provides=(
perl-audio-dsp
)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$_oldver.tar.gz"
'vocp-0.02b.patch'
)
noextract=()

build(){
  cd "$srcdir/$_perlmod-$_oldver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/$_perlmod-$_oldver"
  #make test
}
package(){
  cd "$srcdir/$_perlmod-$_oldver"
  make install DESTDIR="$pkgdir/"
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
md5sums=('7c3027a732d14665d4ffec0aff4b548e'
         '737235cc9a2fd353b239efb06efd782a')
