# Contributor: Devin Hill lvlrk4u@proton.me

pkgname=terxels
pkgver=r11.23793e9
_commit=23793e9c554ab7769a64d278ebdabf9a62ac5655
pkgrel=1
pkgdesc="A super easy-to-use header-only library to freely output pixels in an ANSI terminal"
arch=('any')
url="https://github.com/haedqu/terxels"
license=('MIT')
source=("git+$url.git#commit=$_commit")
sha256sums=('9b7c846a76d20b8a7d97385d05bb21e83adc6c2c510ae3baa19c59680cbecdb5')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $pkgname
    install -Dm644 terxels.h -t "$pkgdir/usr/include"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
