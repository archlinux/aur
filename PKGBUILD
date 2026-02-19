# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_dist='DateTime-Format-RFC3339'
_pkgver='v1.10.0'
pkgname='perl-datetime-format-rfc3339'
pkgver=1.10.0
pkgrel=1
pkgdesc='Parse and format RFC3339 datetime strings'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('CC0-1.0')
depends=(
    'perl-datetime'
    'perl-test-simple'
    'perl>=5.10'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/I/IK/IKEGAMI/$_dist-$_pkgver.tar.gz")
sha256sums=('3a5e64e7beaafd2c64a12109e3cc0fed3db3f893b0323b43b52964fc2c0c8496')

build()
{
    cd $_dist-$_pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_OPT='NO_PACKLIST=1 NO_PERLLOCAL=1' PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL
    make
}

check()
{
    cd $_dist-$_pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$_pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
