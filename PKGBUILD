# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=perl-svn-bisect
_realname=App-SVN-Bisect
pkgver=1.1
pkgrel=2
pkgdesc="'git bisect' workalike for Subversion. Binary search through svn history."
arch=('any')
url="https://search.cpan.org/~infinoid/App-SVN-Bisect-1.1/lib/App/SVN/Bisect.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-io-all' 'perl-test-exception' 'perl-test-output'
         'perl-yaml-syck' 'subversion')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/I/IN/INFINOID/${_realname}-${pkgver}.tar.gz")
md5sums=('a929a878b7bee04adae2e592770c0ea2')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
