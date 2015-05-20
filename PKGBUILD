# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=FGA
_perlmod=Zabbix2-API
pkgname=perl-zabbix2-api
pkgver=0.012
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
  'perl-moo-lax'
  'perl-params-validate'
  'perl-uri'
  )
options=(!emptydirs)
source=(http://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('83dc1afca04e1e409f7758dfda1b8955')

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
