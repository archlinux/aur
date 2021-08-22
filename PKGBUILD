# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=menutray
pkgver=0.54
pkgrel=1

pkgdesc="An application menu through a GTK+ tray status icon."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-gtk3' 'perl-data-dump' 'perl-linux-desktopfiles>=0.25')
optdepends=('perl-file-desktopentry: locale support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('132494fc2ae633e802ec4e81642a99cd673371a22ad027a4024f46df1b428cef1cc9abf3f015776f511ee40c858fbc5e09813fd857ed79ae2f61d7c7a55e9af2')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
