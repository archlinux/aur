pkgname=tabby-terminal
pkgver=1.0.174
pkgrel=1
pkgdesc="A terminal for a modern age"
arch=("x86_64")
url="https://github.com/Eugeny/tabby#readme"
license=("MIT")
provides=("tabby")
depends=(
    "gnome-keyring"
    "libsecret"
)
source=(
    "tabby-${pkgver}-linux.pacman::https://github.com/Eugeny/tabby/releases/download/v${pkgver}/tabby-${pkgver}-linux.pacman"
)
sha256sums=(
    "cb3cf9f768be48ec9b3aa3d24cf3c2b1945edb4bc0483ce0b5b9b50e8dd1329e"
)

package() {
    cd ${srcdir}
    tar -xvf tabby-${pkgver}-linux.pacman -C ${pkgdir}
    # Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
