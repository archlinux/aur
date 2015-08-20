# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-pod-elemental'
pkgver=0.103004
pkgrel=1
pkgdesc='work with nestable Pod elements'
_dist='Pod-Elemental'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-class-load>=0' 'perl-moose>=0' 'perl-sub-exporter>=0' 'perl-mixin-linewise>=0' 'perl-sub-exporter-formethods>=0' 'perl-scalar-list-utils>=1.33' 'perl-string-rewriteprefix>=0' 'perl-encode>=0' 'perl-moosex-types>=0' 'perl-namespace-autoclean>=0' 'perl-pod-eventual>=0.004' 'perl-string-truncate>=0')
provides=('perl-pod-elemental-paragraph=0.103004' 'perl-pod-elemental-types=0.103004' 'perl-pod-elemental-command=0.103004' 'perl-pod-elemental-document=0.103004' 'perl-pod-elemental-transformer=0.103004' 'perl-pod-elemental-flat=0.103004' 'perl-pod-elemental-autochomp=0.103004' 'perl-pod-elemental-autoblank=0.103004' 'perl-pod-elemental-selectors=0.103004' 'perl-pod-elemental-node=0.103004' 'perl-pod-elemental-objectifier=0.103004' 'perl-pod-elemental-transformer-gatherer=0.103004' 'perl-pod-elemental-transformer-pod5=0.103004' 'perl-pod-elemental-transformer-nester=0.103004' 'perl-pod-elemental-element-nested=0.103004' 'perl-pod-elemental-element-pod5-verbatim=0.103004' 'perl-pod-elemental-element-pod5-nonpod=0.103004' 'perl-pod-elemental-element-pod5-command=0.103004' 'perl-pod-elemental-element-pod5-region=0.103004' 'perl-pod-elemental-element-pod5-data=0.103004' 'perl-pod-elemental-element-pod5-ordinary=0.103004' 'perl-pod-elemental-element-generic-nonpod=0.103004' 'perl-pod-elemental-element-generic-command=0.103004' 'perl-pod-elemental-element-generic-text=0.103004' 'perl-pod-elemental-element-generic-blank=0.103004')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('43625cde7241fb174ad9c7eb45387fba410dc141d7de2323855eeab3590072c9')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
