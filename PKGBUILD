# Maintainer: Jean-Charles Quillet <jeancharles.quillet@gmail.com>
pkgname=htagcli-bin
pkgver=0.1.2.0
pkgrel=1
pkgdesc="Command-line tool for viewing and editing tags in audio files"
arch=('x86_64')
url="https://github.com/jecaro/htagcli"
license=('MIT')
provides=('htagcli')
conflicts=('htagcli')
source=("htagcli-${pkgver}.tar.gz::https://github.com/jecaro/htagcli/releases/download/v${pkgver}/htagcli.tar.gz")
sha256sums=('2b4d0e1790efb47e7ed22a9653f1208748323f4f38e4cf9a628501849e5b1b24')

package() {
    install -Dm755 htagcli "${pkgdir}/usr/bin/htagcli"

    ./htagcli --bash-completion-script htagcli \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/htagcli"
    ./htagcli --zsh-completion-script htagcli \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_htagcli"
    ./htagcli --fish-completion-script htagcli \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/htagcli.fish"
}
