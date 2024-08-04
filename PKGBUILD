# Maintainer: Traube1000101 <girlscoutcookies420@gmx.net>
pkgname=baka
pkgver=1.0.0
pkgrel=1
pkgdesc="Backup files or directories (with confirmation if larger than 1GiB)"
arch=('any')
url="https://github.com/Traube1000101/${pkgname}"
license=('MIT')
depends=(
    'bash'
    'dialog'
)
source=("https://github.com/Traube1000101/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ce7f3089c64f6522d8ae82245ed6da996f9a3f07407ef9e5c6f66aea3239dda2')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
