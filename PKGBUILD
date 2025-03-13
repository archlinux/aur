# Maintainer: Eleanor Kelley <me at eleanorkelley dot com>

_pkgname=scopebuddy
pkgname=$_pkgname-git
pkgver=1.0.0.r1.g7207629
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
