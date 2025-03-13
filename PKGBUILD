# Maintainer: Veillain <veillainwertz@gmail.com>
pkgname=currento
pkgver=1.0.0.r0.ge138498
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
    install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm755 src/${pkgname} -t "${pkgdir}/usr/bin/"
    echo -e "\nsource /usr/bin/currento" >> $HOME/.bashrc
}
