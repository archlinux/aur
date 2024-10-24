# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.28
pkgrel=5
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$_pkgname"
license=('MIT')
source_x86_64=("$_pkgname-$pkgver::https://github.com/ChrisTitusTech/$_pkgname/releases/download/$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/ChrisTitusTech/$_pkgname/refs/heads/main/$_pkgname.desktop"
    "https://raw.githubusercontent.com/ChrisTitusTech/$_pkgname/refs/heads/main/man/$_pkgname.1")
source_aarch64=("$_pkgname-$pkgver::https://github.com/ChrisTitusTech/$_pkgname/releases/download/$pkgver/$_pkgname-aarch64"
    "https://raw.githubusercontent.com/ChrisTitusTech/$_pkgname/refs/heads/main/$_pkgname.desktop"
    "https://raw.githubusercontent.com/ChrisTitusTech/$_pkgname/refs/heads/main/man/$_pkgname.1")
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums_x86_64=('224fe5f878cf5e5b0d98cbff886340af3519b968187cc641cfcfcd7f904c59b3' 'SKIP' 'SKIP')
sha256sums_aarch64=('d1db3fe53c7c2258a1bb181bdd4afa9b96de21365d412c4f90c034104671f97b' 'SKIP' 'SKIP')

prepare() {
    echo "Version=$pkgver" >> "$_pkgname.desktop"
}

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
