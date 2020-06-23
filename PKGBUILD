# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=fbmenugen
pkgver=0.85
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
sha256sums=('99ea3bf39a153c1c05bcd7881d7708fc575c485855e8d8b022520b43013ceb26')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
