# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Oscar Pereira <gauthma dot san att gmail com>

pkgname=perl-file-keepass
pkgver=2.03
pkgrel=3
pkgdesc="Interface to KeePass V1 and V2 database files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-crypt-rijndael' 'perl-digest-sha' 'perl-xml-parser')
url='http://search.cpan.org/dist/File-KeePass'
source=("http://search.cpan.org/CPAN/authors/id/R/RH/RHANDOM/File-KeePass-${pkgver}.tar.gz")
sha256sums=('c30c688027a52ff4f58cd69d6d8ef35472a7cf106d4ce94eb73a796ba7c7ffa7')

build() {
  cd "File-KeePass-${pkgver}"
  PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" PERL5LIB="" perl Makefile.PL INSTALLDIRS=vendor
  make
  make test
}

package() {
  cd "File-KeePass-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
