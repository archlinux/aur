# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=hyprpolkitagent
pkgname="$_pkgname-bin"
pkgver=0.1.1
pkgrel=2
pkgdesc="A simple polkit authentication agent for Hyprland, written in QT/QML"
arch=('x86_64')
url="https://github.com/hyprwm/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('BSD-3-Clause')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/v$pkgver.tar.gz"
    "LICENSE-$pkgver::$_url_raw/refs/tags/v$pkgver/LICENSE")
sha256sums=('a5b68b6bf02bdb62168fb1e5f2cd2b049a0c19e88d44746abc5a142ab986e757'
            '52d07f3457591b4496ae2e79b05efd63c7df72135666fa12428d83078c4c0de5')
depends=('gcc-libs' 'qt6-base' 'polkit-qt6' 'qt6-declarative' 'glib2')
makedepends=('git' 'cmake' 'gcc' 'qqc2-desktop-style' 'hyprutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
    cd "$_pkgname"
    install -Dm0755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm0755 "$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$srcdir/LICENSE-$pkgver" -t "$pkgdir/usr/share/licenses/$pkgname"
}
