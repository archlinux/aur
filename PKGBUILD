# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: omangold
# Maintainer: Daenyth
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>

pkgname='perl-ogg-vorbis-header'
pkgver='0.11'
pkgrel='1'
pkgdesc="An object-oriented interface to Ogg Vorbis"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-inline>=0.44' 'perl-inline-c>=0')
makedepends=()
url='https://metacpan.org/release/Ogg-Vorbis-Header'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/Ogg-Vorbis-Header-${pkgver}.tar.gz")
md5sums=('6155966ef4592641a61730a4a199b7a3')
sha512sums=('edef27bcb7d737a655c6f3c6dc4311442bb97f9cdebd14d930a0443fc56f073d47ec73fe2fddbe5d4b00670f8cc833ae6263796f0017d846b43a6dba44866b2b')
_distdir="Ogg-Vorbis-Header-${pkgver}"

package() {
  cd $srcdir/$_distdir
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
  make DESTDIR=$pkgdir install || return 1
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
