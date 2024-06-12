# Contributor: Matthias Bethke <m+aur@towiski.de>
#  previously: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-amazon-s3'
pkgver='2.0.2'
pkgrel='2'
pkgdesc='A portable client library for working with and managing Amazon S3 buckets and keys.'
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=(
  'perl-class-accessor'
  'perl-digest-hmac'
  'perl-digest-md5-file'
  'perl-http-date'
  'perl-io-stringy'
  'perl-lwp-useragent-determined'
  'perl-net-amazon-signature-v4'
  'perl-readonly'
  'perl-test-output'
  'perl-uri'
  'perl-xml-simple>=1.08'
)
makedepends=(
  'autoconf'
  'automake'
  'make'
  'perl-pod-markdown'
)
url='https://github.com/rlauer6/perl-amazon-s3'
source=("https://github.com/rlauer6/perl-amazon-s3/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('f546d3819b18b5e562a4b3a2e52f55bf')
sha512sums=('44f992d98fd30087f48e899198d3f4b81d757a0ad67a5f646f1665681aca2a80ea1c3064ca534d3a4f13b7d8ba6e53f25b2df626a3f60561fccfd27be4bbb356')
_distdir="perl-amazon-s3-${pkgver}"

build() {
  cd "$srcdir/$_distdir"
  ./bootstrap
  ./configure --prefix=/usr --with-perl5libdir=/usr/share/perl5/vendor_perl
  make
}

package() {
  cd "$srcdir/$_distdir"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
