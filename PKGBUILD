# Maintainer: Eleanor Kelley <me at eleanorkelley dot com>

_pkgname=scopebuddy
pkgname=$_pkgname-git
pkgver=1.1.0.r0.g170e154
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
    'steam: Steam integration'
    'gamemode: gamemode integration'
    'plasma-desktop: Automatic display detection'
    'libkscreen: Automatic display detection'
    'jq: Automatic display detection'
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
