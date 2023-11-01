# Maintainer: Schrottfresse <schrottfresse@gmx.de>

pkgname=perl-term-shell
_cpanname=Term-Shell
pkgver=0.13
pkgrel=1
pkgdesc="A simple command-line shell framework for Perl"
arch=('any')
url="http://search.cpan.org/dist/Term-Shell/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-text-autoformat' 'perl-module-build' 'perl-term-readkey')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/${_cpanname}-${pkgver}.tar.gz)
sha256sums=('53a0bdb2656891c508a470d93cb7e1cfeab38eea9e5829560a7d8b5f600f6bf2')

build() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  perl Build.PL
  ./Build
  gzip blib/libdoc/Term::Shell.3pm
}

package() {
  cd "${_cpanname}-${pkgver}"

  install -m 644 -Dt "$pkgdir/usr/share/perl5/core_perl/Term/" blib/lib/Term/Shell.pm
  install -m 644 -Dt "$pkgdir/usr/share/man/man3/" blib/libdoc/Term::Shell.3pm.gz
}

# vim:set ts=2 sw=2 et:
