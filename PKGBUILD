# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=perl-linux-desktopfiles
_pkgname=Linux-DesktopFiles
pkgver=0.09
pkgrel=1
pkgdesc="Perl module to get and parse the Linux .desktop files"
arch=('any')
url="https://metacpan.org/module/Linux::DesktopFiles"

source="http://cpan.metacpan.org/authors/id/T/TR/TRIZEN/${_pkgname}-${pkgver}.tar.gz"
sha256sums=('45afb52301ed1553fa741c40e62dc91280bb0e6e58dad83e6a49415a02f0973b')

license=('GPLv3')

depends=('perl>=5.14.0')
makedepends=('perl-module-build')

package() {
    cd "${_pkgname}-$pkgver"
    perl Build.PL --destdir "$pkgdir" --installdirs vendor
    ./Build
    ./Build test
    ./Build install
}
