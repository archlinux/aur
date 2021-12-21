# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-rpc-xml
_pkgname='RPC-XML'
pkgver=0.82
pkgrel=1
pkgdesc='A set of classes for core data, message and XML handling'
url='https://metacpan.org/dist/RPC-XML'
arch=('any')
license=('PerlArtistic' 'LGPL')
options=('!emptydirs')
depends=('perl>=5.8.8' 'perl-xml-parser>=2.31')
optdepends=('perl-xml-libxml: XML::LibXML support'
            'perl-datetime-format-iso8601: DateTime::Format::ISO8601 support'
            'perl-net-server: Net::Server support')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJRAY/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5279eb0d136c533ff897f6934c3aad6f20504b997fb2606e52c5dbbd92758e73')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PERL_MM_USE_DEFAULT=1 PERL5LIB='' \
           PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=${pkgdir}"

    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=''
    make test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install

    find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
