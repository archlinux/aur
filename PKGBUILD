# Maintainer: Hyprland Control Center <https://github.com/laosifu/Hyprland-Control-Center>
# Contributor: laosifu

pkgname=hcc-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Hyprland Control Center — Install and manage Hyprland desktops"
arch=('any')
url="https://github.com/laosifu/Hyprland-Control-Center"
license=('GPL-3.0-only')
depends=('bash' 'git' 'curl' 'sudo')
optdepends=(
    'python: TOML config parser (faster than pure-bash)'
    'yay: AUR package installation'
    'paru: AUR package installation'
)
conflicts=('hcc-git')
provides=('hcc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=hcc.install

package() {
    cd "$srcdir/Hyprland-Control-Center-$pkgver"

    install -Dm755 bin/hcc "$pkgdir/usr/bin/hcc"

    install -Dm755 lib/launchers/session-launcher.sh \
        "$pkgdir/usr/lib/hcc/session-launcher"

    install -dm755 "$pkgdir/usr/share/hcc"
    cp -a desktops "$pkgdir/usr/share/hcc/desktops"
    cp -a lib "$pkgdir/usr/share/hcc/lib"
    cp -a services "$pkgdir/usr/share/hcc/services"
    cp -a operations "$pkgdir/usr/share/hcc/operations"
    cp -a modules "$pkgdir/usr/share/hcc/modules"
    cp -a plugins "$pkgdir/usr/share/hcc/plugins"
    cp -a themes "$pkgdir/usr/share/hcc/themes"
    cp -a handlers "$pkgdir/usr/share/hcc/handlers"
    cp -a VERSION "$pkgdir/usr/share/hcc/VERSION"
    cp -a docs "$pkgdir/usr/share/hcc/docs"
}
