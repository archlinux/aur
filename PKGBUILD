# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=menutray
pkgver=0.53
pkgrel=1

pkgdesc="An application menu through a GTK+ tray status icon."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'gtk2-perl' 'perl-data-dump' 'perl-linux-desktopfiles>=0.25')
optdepends=('perl-gtk3: for Gtk3 support (--gtk3)'
            'perl-file-desktopentry: locale support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5d3da38bf626f0969221ef5db1cbd7d49ab1c1506aa423967b6d59780ee3b360')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
