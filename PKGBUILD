pkgname=tabby-terminal
pkgver=1.0.173
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
    "ebfd68daf6f06702c88a1b58222375ef17ee9e5cd1258bbf8af7cb1e5d1fdc06"
)

package() {
    cd ${srcdir}
    tar -xvf tabby-${pkgver}-linux.pacman -C ${pkgdir}
    # Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
