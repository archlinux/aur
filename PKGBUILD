# Maintainer: Veillain <veillainwertz@gmail.com>
pkgname=currento
pkgver=1.0.0.r2.g9f69d74
pkgrel=1
pkgdesc="A package to extend the basic 'cd' command. Currento adds some features that shouldn't be in basic 'cd'."
arch=("any")
url="https://github.com/veillain/currento"
license=("GPL-3.0-or-later")
depends=("git")
provides=("currento")
conflicts=("currento")
source=("${pkgname}-${pkgver}::git+https://github.com/veillain/currento.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}-${pkgver}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo -e "\nsource /usr/bin/currento" >> $HOME/.bashrc
}
