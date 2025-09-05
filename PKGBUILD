# Maintainer: Kareem Khazem <karkhaz at karkhaz dot com>

pkgname=ratatui-docs
pkgver=0.29.0
pkgrel=1
pkgdesc="Documentation for Ratatui Rust package"
arch=("any")
url="https://ratatui.rs"
license=("MIT")
sha256sums=()

prepare() {
    git clone \
        --revision=refs/heads/gh-pages \
        https://github.com/ratatui/ratatui-website \
        "${pkgname}"
    rm -rf "${pkgname}/.git"
}

package() {
    dest="${pkgdir}/usr/share/doc/ratatui/html"
    install -d "${dest}"
    cp -a "${pkgname}"/* "${dest}"
}

# vim:set ts=4 sw=4 et:
