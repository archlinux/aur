# Maintainer : Brian Bidulock <bidulock@openss7.org>
# Contributor : Mr_Men <tetcheve at gmail dot com>

pkgname=perl-xml-tokeparser
_realname=XML-TokeParser
pkgver=0.05
pkgrel=4
pkgdesc="Perl/CPAN Module XML::TokeParser"
arch=('any')
license=('GPL' 'PerlArtistic')
url=http://search.cpan.org/CPAN/authors/id/M/ME/MERLYN/

depends=('perl' 'perl-xml-parser>=2')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/P/PO/PODMASTER/${_realname}-$pkgver.tar.gz")
md5sums=('a886ac451d99dca522df20d7cf7b28b4')

build () {
  cd ${_realname}-$pkgver
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package () {
  cd ${_realname}-$pkgver
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find ${pkgdir} \( -name perllocal.pod -o -name .packlist \) -delete
}

