# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=obmenu-generator
pkgver=0.84
pkgrel=1

pkgdesc="A fast pipe/static menu generator for the Openbox Window Manager (with icons support)."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPL3')

depends=('openbox' 'perl>=5.14.0' 'perl-data-dump' 'perl-linux-desktopfiles>=0.25')
optdepends=(
    'gtk2-perl: support for icons'
    'perl-file-desktopentry: locale support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('acab25614e04cad0916e568bfd72014d0a3ada7c1bb8dc82d36bdf6b5c934ff9')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
