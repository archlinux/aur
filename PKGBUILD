# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mousex-getopt'
pkgver='0.38'
pkgrel='3'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-getopt-long-descriptive>=0.091' 'perl-mouse>=0.64' 'perl-mousex-configfromfile>=0' 'perl-mousex-simpleconfig>=0')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-mouse>=0' 'perl-test-exception>=0.21' 'perl-test-warn>=0.21')
url='https://metacpan.org/release/MouseX-Getopt'
source=("https://cpan.metacpan.org/authors/id/G/GF/GFUJI/MouseX-Getopt-$pkgver.tar.gz"
        '104_override_usage.t.patch'
        '107_no_auto_help.t.patch'
        '109_help_flag.t.patch'
        '110_sort_usage_by_attr_order.t.patch')
md5sums=('d20571d847982922e8f1503223263a39'
         '29994138892a04ae21a66c18f4b85293'
         '25e48521326d68ea3eea3d3487d100e8'
         '21667f07bf395b435d09932be0397cf6'
         'e91089b7e494ae2a613e2b9b4ef26d21')
sha512sums=('2a1f870f45f8b9ceae5f16421257f7b0b5fe97e09af9968686a00cbf320c56cfd6ad3ba7b2fcf714f22add98b0843a7e2b46f8d9b3c9ce36b2e9840b2ca5e621'
            '2d4bb81b746af77300b85070373c70a92614a172d99e2b9d92ef8e7681f868ba08b9acc533ac256c05d71043e0e8a831caf873d7eb7c3550156b7b4f7542f6ca'
            '624519979b016d76264b735c6038601bca57c31197a304619f8fe952f509b36ced80adbb84db8862a46eb5a9880a33b6d072790b8aa345a2117eab6a87ae6f7f'
            '7b343e15f2c67cf08bcf539e8eee1b8f520426028a725c82697f82fd2974949081b005d3557fd4edc64ce282b320b94bbc9dcb38468f01a6aa8eddc512b89bc4'
            '4b7597e63f2ef7a558a285a638978f82035e07d43cd5e94b5e7885e1e894d43dae5a50c8757cdbc8216ed90fb1d5f0af7e730b483111039eeb56ec0cd06ccf88')
_distdir="MouseX-Getopt-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

prepare() {
  cd "$srcdir/$_distdir/t"
  patch -p0 -i "$srcdir/104_override_usage.t.patch"
  patch -p0 -i "$srcdir/107_no_auto_help.t.patch"
  patch -p0 -i "$srcdir/109_help_flag.t.patch"
  patch -p0 -i "$srcdir/110_sort_usage_by_attr_order.t.patch"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
