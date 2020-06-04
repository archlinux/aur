# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=mdpreview-git
pkgver=r79.576dacb
pkgrel=1
pkgdesc="A simple QT-based Markdown previewer, designed to be used with an external editor"
arch=("x86_64")
url="https://github.com/fboender/mdpreview"
license=("GPL3")
depends=("python-pyqt5" "python-markdown" "python-pyinotify" "python-markdown-checklist-git")
makedepends=("git")
provides=("mdpreview")
source=("git+https://github.com/fboender/mdpreview.git")
sha256sums=("SKIP")

# for convenience
_pkgname=mdpreview

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    chmod +x ./install.sh
    INSTALL_PATH=$pkgdir/usr ./install.sh
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
