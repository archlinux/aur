# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=fbmenugen
pkgver=0.84
pkgrel=1
pkgdesc="A simple menu generator for the Fluxbox Window Manager (with support for icons)."
arch=('any')
url="https://github.com/trizen/$pkgname"
license=('GPL3')
depends=('perl>=5.14.0' 'fluxbox' 'perl-data-dump' 'perl-linux-desktopfiles>=0.25')

optdepends=(
    'gtk2-perl: support for icons'
    'perl-file-desktopentry: locale support'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('cc57fa3cced4f959281497b4276052321d88046e358cea27e1cc4363c6f714d1')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
