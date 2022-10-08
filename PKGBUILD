pkgname=i3expo-ng-git
pkgver=r75.6768f5a
pkgrel=1
epoch=0
pkgdesc="Exposè for i3 WM"
arch=('any')
url="https://github.com/morrolinux/i3expo-ng"
license=("MIT")
provides=('i3expo')
depends=("python" "python-pygame" "python-i3ipc" "python-pillow" "python-pyxdg")
makedepends=("git" "python-pip" "make")
source=("${pkgname}::git+https://github.com/morrolinux/i3expo-ng.git")
md5sums=("SKIP")
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$pkgname"
    make
}
package() { 
    cd "$pkgname"
    install -Dm 0644 defaultconfig  "${pkgdir}/usr/share/doc/i3expod/defaultconfig"
    install -Dm 0755 prtscn.so "${pkgdir}/usr/bin/prtscn.so"
    install -Dm 0755 i3expod.py "${pkgdir}/usr/bin/i3expod"
}
