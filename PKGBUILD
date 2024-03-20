# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=switcheroo
pkgname=$_pkgname-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A cross platform, Rust implementation for the Tegra X1 bootROM exploit (binary release)"
url="https://github.com/budde25/switcheroo"
license=('GPL-2.0-only')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/switcheroo-nx-x86_64-unknown-linux-gnu.tar.xz"
        "$url/raw/v$pkgver/extra/logo/io.ebudd.Switcheroo.png"
        "$url/raw/v$pkgver/extra/linux/io.ebudd.Switcheroo.desktop")
sha256sums=('6dbff5244be3972615a3815dca0d7d25918b220c9d06d1c40ced87eedb8cc46b'
            'd858691ed334bf34ee84e4d8e8499b62898ad3c90422e6bf12ef60d254ea9c82'
            '27830d20aca6c5165f2d59a0dfee51f6cc61d64fe4a8541ea659a818aa2def43')

package() {
  install -Dm644 io.ebudd.Switcheroo.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 io.ebudd.Switcheroo.desktop -t "$pkgdir/usr/share/applications"
  cd switcheroo-nx-x86_64-unknown-linux-gnu
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
