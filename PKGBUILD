# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-shell-extension-transparent-top-bar-git
pkgver=r10.31714cf
pkgrel=1
pkgdesc="Bring back the transparent top bar when free-floating in GNOME Shell 3.32"
arch=(any)
url="https://extensions.gnome.org/extension/1708/transparent-top-bar/"
license=(GPL)
depends=(gnome-shell)
makedepends=(git)
provides=(gnome-shell-extension-transparent-top-bar)
conflicts=(gnome-shell-extension-transparent-top-bar)
source=("git+https://github.com/zhanghai/gnome-shell-extension-transparent-top-bar.git")
sha256sums=(SKIP)

pkgver() {
    cd gnome-shell-extension-transparent-top-bar
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd gnome-shell-extension-transparent-top-bar
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/transparent-top-bar@zhanghai.me"
    install -t "${pkgdir}/usr/share/gnome-shell/extensions/transparent-top-bar@zhanghai.me" src/*
}
