# Maintainer: maromnztt <mmanzotti at dc.uba.ar>

_gitpkgname=plasmavantage
pkgname=plasma6-applets-plasmavantage
pkgver=0.29
pkgrel=2
pkgdesc="Plasmoid for KDE Plasma 6 for controlling certain features of Lenovo laptops."
arch=(any)
url="https://gitlab.com/Scias/$_gitpkgname"
license=('MPL-2.0')
depends=(
    bash
    kirigami
    knotifications
    libplasma
    plasma5support
    plasma-workspace
    qt6-declarative
)
optdepends=(
    "lenovolegionlinux-git: Additional features for Lenovo Legion laptops"
)
source=("$url/-/archive/$pkgver/$_gitpkgname-$pkgver.tar.gz")
sha256sums=('93ac8416a83867319d76d30017b4c12e46da4b487001ad20bffd744eb8770b8d')
install=.install

package() {
    cd "$_gitpkgname-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    mkdir -p "$pkgdir/usr/share/plasma/plasmoids/com.gitlab.scias.$_gitpkgname/"
    cp -r package/* "$pkgdir/usr/share/plasma/plasmoids/com.gitlab.scias.$_gitpkgname/"
    install -Dm644 package/contents/util/plasmavantage-noroot.service "$pkgdir/usr/lib/systemd/system/plasmavantage-noroot.service"
}
