# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
_author=SUJITSALI
_perlmod=Zabbix2-API
pkgname=perl-zabbix2-api
pkgver=0.014
pkgrel=1
pkgdesc="Access the JSON-RPC API of a Zabbix server"
arch=('any')
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=(
  'perl>=5.10.0'
  'perl-json'
  'perl-log-any'
  'perl-libwww'
  'perl-moo>=1.001000'
  'perl-params-validate'
  'perl-uri'
  )
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('72dd8b8c5bd268800db939c4ab13a6f3487351a840335c468f72f5a23b19b74c')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install

}

# vim:set ts=2 sw=2 et:
