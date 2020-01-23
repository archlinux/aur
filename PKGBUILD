# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=obmenu-generator
pkgver=0.87
pkgrel=1

pkgdesc="A fast pipe/static menu generator for the Openbox Window Manager (with icons support)."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPL3')

depends=('openbox' 'perl>=5.14.0' 'perl-data-dump' 'perl-linux-desktopfiles>=0.25')
optdepends=(
    'gtk2-perl: support for icons'
    'perl-gtk3: support for icons (with `use_gtk3 = 1`)'
    'perl-file-desktopentry: locale support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('761aa7310d01dc6748c329aabfa95c62656e92b169db3b2d435a338f9bb8e19a')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
