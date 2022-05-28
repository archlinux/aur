pkgname=tabby-terminal
pkgver=1.0.178
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
    "tabby-${pkgver}-linux.pacman::https://github.com/Eugeny/tabby/releases/download/v${pkgver}/tabby-${pkgver}-linux-x64.pacman"
)
sha256sums=(
    "64bc15b8a7c84dd6e180797f2394ceae19b34c965bd3c18c28856c77b72b48eb"
)

package() {
    cd ${srcdir}
    tar -xvf tabby-${pkgver}-linux.pacman -C ${pkgdir}
    # Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
