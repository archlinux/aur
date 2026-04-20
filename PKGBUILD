# SPDX-FileCopyrightText: 2026 Olivier Melcher <olivier.melcher@gmail.com>
# SPDX-License-Identifier: 0BSD
# Maintainer: Olivier Melcher <olivier.melcher@gmail.com>

pkgname=omarchy-world-clock-bin
_pkgname=omarchy-world-clock
_target=x86_64-unknown-linux-gnu
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial Waybar world clock integration for Omarchy"
arch=('x86_64')
url="https://github.com/olivoil/omarchy-world-clock"
license=('MIT')
depends=('cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'gtk4-layer-shell' 'libgcc')
optdepends=('waybar: status bar integration'
            'hyprland: target compositor for Omarchy sessions')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
install="$pkgname.install"
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-${_target}.tar.gz"
)
source=('LICENSE.omarchy-world-clock')
sha256sums=('6fe2cafb9b5011c7c3de24ba23fc38394670ba7cb8b335a44ee03854b1de9143')
sha256sums_x86_64=('558aeaad82b87bd3822c8b59d67832fc65f2a2117697732d42592645404639dc')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE.omarchy-world-clock" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
