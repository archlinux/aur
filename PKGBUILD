# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=obmenu-generator
pkgver=0.93
pkgrel=1

pkgdesc="A fast pipe/static menu generator for the Openbox Window Manager (with icons support)."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'openbox' 'perl-data-dump' 'perl-gtk3' 'perl-linux-desktopfiles>=0.25')
optdepends=(
    'perl-file-desktopentry: locale support'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('19fca5960ab423c9df145d3f8f7fc47a07bdfa0302d62d6565d3218296da0f24a93476e73e21413430ec4842bae64432aabbff930968d13c1ebc2f95da389ab1')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
