# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=fbmenugen
pkgver=0.87
pkgrel=1
pkgdesc="A simple menu generator for the Fluxbox Window Manager (with support for icons)."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'fluxbox' 'perl-data-dump' 'perl-linux-desktopfiles>=0.25')
optdepends=(
    'perl-gtk3: support for icons'
    'perl-file-desktopentry: locale support'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('af085e99ebb2d8b579901f8c490874842d0d9299665e160e4aaf0c61d116af9af74c227c148ed64ddb2833d8d52d4b479e75d94392bad717f3e87091610ded00')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
