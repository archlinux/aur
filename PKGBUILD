# Maintainer: ssfdust <ssfdust@gmail.com>

pkgname=pulse-glass-tri-color
pkgver=1.1
pkgrel=1
pkgdesc="This small derivative collection comprises of Amber, Jade and Sapphire (orange,green,blue). Sizes Regular (32px) and Small (24px) apply."
arch=('any')
url="https://store.kde.org/p/999818/"
license=('GPL')
depends=()
source=("${pkgname}.tar.gz::https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1460735003/Pulse-Glass-Jan-2017-Fix.tar.gz?response-content-disposition=attachment%3B%2520Pulse-Glass-Jan-2017-Fix.tar.gz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20230103%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230103T072143Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=6c5d9d0b77ab8963c680cab66c25f2d0614d23b1a975287dca5d7b7ba7d8a3ee")
sha256sums=('cd45db012f6f34c13b3012b63ed7d2e6692392f5ec7e669ac51752db991c27cf')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/icons"
    # Delete duplicate symbol link
    find . -maxdepth 1 -type l -delete
    # Copy all theme files
    find . -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/icons/{}" \;
    # Copy all symbol links under directory
    find . -type l -exec cp -P "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=4 sw=4 et:
