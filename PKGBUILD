# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=hyprpolkitagent
pkgname="$_pkgname-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple polkit authentication agent for Hyprland, written in QT/QML"
arch=('x86_64')
url="https://github.com/hyprwm/$_pkgname"
license=('BSD-3-Clause')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/v$pkgver.tar.gz")
sha256sums=('a5b68b6bf02bdb62168fb1e5f2cd2b049a0c19e88d44746abc5a142ab986e757')
depends=('qt6-base' 'polkit-qt6' 'qqc2-desktop-style')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
    cd "$_pkgname"
    install -Dm0755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm0755 "$_pkgname.service" -t "$pkgdir/etc/systemd/system"
}
