# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Maintainer: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=perl-proc-queue
pkgver=1.23
pkgrel=1
pkgdesc="Limit the number of child processes running."
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Proc-Queue/"
license=('Perl') 
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/Proc-Queue-${pkgver}.tar.gz")
md5sums=('57a153870f697b2dbf261bdfe09d61a0')

build() {
  cd "${srcdir}"/Proc-Queue-${pkgver}

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd "${srcdir}"/Proc-Queue-${pkgver}

  make DESTDIR="${pkgdir}" install

  # Remove .packlist and perllocal.pod files.
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name 'perllocal.pod' -delete
}

# vim:set ts=2 sw=2 et:
