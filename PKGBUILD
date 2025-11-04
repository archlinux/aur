# Maintainer: Eleanor Kelley <me at eleanorkelley dot com>

_pkgname=scopebuddy
pkgname=$_pkgname-git
pkgver=1.2.3.r0.g5a04aca
pkgrel=1
pkgdesc="gamescope helper script"
arch=(any)
url="https://github.com/HikariKnight/ScopeBuddy"
license=('Apache-2.0')
depends=(
    'bash'
    'gamescope'
    'procps-ng'
    'perl'
    'coreutils'
)
makedepends=('git')
optdepends=(
    'jq: Automatic display detection'
    'libkscreen: Automatic display detection (Plasma)'
    'mutter: Automatic display detection (GNOME)'
    'gnome-randr-rust: Automatic display detection (GNOME fallback)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/HikariKnight/ScopeBuddy")
b2sums=('SKIP')
pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    install -Dm755 $_pkgname/bin/scopebuddy "$pkgdir"/usr/bin/scopebuddy
    ln -sf scopebuddy "$pkgdir"/usr/bin/scb
}
