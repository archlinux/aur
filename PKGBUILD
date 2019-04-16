# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-lwp-useragent'
pkgver='0.033'
pkgrel='2'
pkgdesc="A LWP::UserAgent suitable for simulating and testing network calls"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')

# === Runtime Requires ===
#
#     Module           Want     Have
#     ---------------- ---- --------
#     Carp              any     1.50
#     HTTP::Date        any     6.02
#     HTTP::Request     any     6.18
#     HTTP::Response    any     6.18
#     HTTP::Status      any     6.18
#     IO::Socket::IP   0.31     0.39
#     LWP::UserAgent    any     6.38
#     Safe::Isa         any 1.000010
#     Scalar::Util      any     1.50
#     Storable          any     3.08
#     Try::Tiny         any     0.30
#     URI              1.62     1.76
#     namespace::clean 0.19     0.27
#     parent            any    0.236
#     strict            any     1.11
#     warnings          any     1.42
#
# === Other Modules ===
#
#     Module                          Have
#     --------------------------- --------
#     IO::Socket::INET                1.39
#     IO::Socket::INET6               2.72
#     IO::Socket::IP                  0.39
#     IO::Socket::SSL                2.060
#     JSON::MaybeXS               1.004000
#     JSON::PP                     2.97001
#     LWP::Protocol::http             6.38
#     LWP::Protocol::http::Socket  missing
#     Moose                         2.2011
#     Net::SSLeay                     1.85
#     Plack                         1.0047
#     Pod::Coverage                   0.23
#     Sub::Name                       0.21
#     YAML                            1.15
#     autodie                         2.29

depends=(
  'perl-http-date'
  'perl-http-message'
  'perl-libwww'
  'perl-namespace-clean>=0.19'
  'perl-path-tiny'
  'perl-safe-isa'
  'perl-try-tiny'
  'perl-uri>=1.62'
  'perl>=5.006'
)
makedepends=()

# === Test Requires ===
#
#     Module                  Want     Have
#     ---------------------- ----- --------
#     ExtUtils::MakeMaker      any     7.34
#     File::Spec               any     3.74
#     HTTP::Request::Common    any     6.18
#     Path::Tiny               any    0.108
#     Test::Deep             0.110    1.128
#     Test::Fatal              any    0.014
#     Test::More              0.88 1.302162
#     Test::Needs              any 0.002006
#     Test::RequiresInternet   any     0.05
#     Test::Warnings         0.009    0.026
#     if                       any   0.0608
#     lib                      any     0.64
#     overload                 any     1.30
#
# === Test Recommends ===
#
#     Module         Want     Have
#     ---------- -------- --------
#     CPAN::Meta 2.120900 2.150010

checkdepends=(
  'perl-test-deep>=0.110'
  'perl-test-fatal'
  'perl-test-needs'
  'perl-test-requires'
  'perl-test-requiresinternet'
  'perl-test-warnings>=0.009'
)
url='https://metacpan.org/release/Test-LWP-UserAgent'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-LWP-UserAgent-0.033.tar.gz')
md5sums=('0ec577e7c12c5a1c56ad97822e0f46a6')
sha512sums=('d04dd50a5039149c81a80aabda741c9373601e1d84a878e9a48a77b476d3e2f69a604ad02776297bf99b1ce0bbb9d5a22b276389912fd3fc83964e3931217312')
_distdir="Test-LWP-UserAgent-0.033"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
