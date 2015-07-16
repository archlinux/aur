#Maintainer : Mr_Men <tetcheve at gmail dot com>

pkgname=perl-xml-tokeparser
_realname=XML-TokeParser
pkgver=0.05
pkgrel=1
pkgdesc="Perl/CPAN Module XML::TokeParser"
arch=('i686' 'x86_64')
license=('unknown')
url=http://search.cpan.org/CPAN/authors/id/M/ME/MERLYN/

depends=('perl')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/P/PO/PODMASTER/${_realname}-$pkgver.tar.gz")
md5sums=('a886ac451d99dca522df20d7cf7b28b4')

build () {
  cd $startdir/src/${_realname}-$pkgver
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package () {
  cd $startdir/src/${_realname}-$pkgver
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

