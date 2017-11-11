# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: xduugu

pkgname=perl-docs
pkgver=5.22.0
pkgrel=1
pkgdesc="Set of HTML documentation for Perl."
arch=('any')
url="http://perldoc.perl.org/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(docs !strip)
# source=(perldoc-html-$pkgver.tar.gz::http://perldoc.perl.org/perldoc-html.tar.gz)
source=(http://perldoc.perl.org/perldoc-html.tar.gz)
sha256sums=('587786dfe158b9f832a02121d017a36eedd158aa47113947ebe9150c60c6c112')
pkgver() {
  cd "$srcdir"/perldoc-html
  perl -0777  -ne 's{.*?perl_version">(.*?)</div.*}{$1}s;s/^\s+|\s+$//g;@v=m/([\d.]+)/g;print join".",@v' index.html
}
package() {
  cd "$srcdir"/perldoc-html
  install -d "$pkgdir"/usr/share/doc/perl/
  cp -rf * "$pkgdir"/usr/share/doc/perl
}
