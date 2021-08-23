# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=fbmenugen
pkgver=0.86
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
sha512sums=('0161cb078b93044a5baa9c4ad299cf09618a453dff12f044fef5a781aa07d0ad82ee25b806663950c5247f8ace25df26ad6101fc87530bc8947e64b5fe9c74d7')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
