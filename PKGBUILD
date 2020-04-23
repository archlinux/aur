# Maintainer: Colin Woodbury <colin@fosskers.ca>
_hkgname=aura
pkgname=aura-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A secure package manager for Arch Linux and the AUR - Prebuilt binary"
url="https://github.com/fosskers/aura"
license=('GPL-3')
arch=('x86_64')
depends=('gmp' 'pacman' 'git')
optdepends=()
provides=('aura')
conflicts=('aura' 'aura-git')
options=('strip')
source=(https://github.com/fosskers/aura/releases/download/v${pkgver}/aura-${pkgver}-x86_64.tar.gz)
md5sums=('2eea36d0c9392fa2798d4a71e849755d')

package() {
    # Install aura binary
    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 aura "$pkgdir/usr/bin/"

    # Installing man page
    mkdir -p "$pkgdir/usr/share/man/man8/"
    install -m 644 aura.8 "$pkgdir/usr/share/man/man8/aura.8"

    # Installing bash completions
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    install -m 644 bashcompletion.sh "$pkgdir/usr/share/bash-completion/completions/aura"

    # Installing zsh completions
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    install -m 644 _aura "$pkgdir/usr/share/zsh/site-functions/_aura"

    # Directory for storing PKGBUILDs
    mkdir -p "$pkgdir/var/cache/aura/pkgbuilds"

    # Directory for storing source packages
    mkdir -p "$pkgdir/var/cache/aura/src"

    # Directory for storing installed package states
    mkdir -p "$pkgdir/var/cache/aura/states"
}
