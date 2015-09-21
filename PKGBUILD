# Maintainer: Alexander Keller <git@nycroth.com>
pkgname=tag
pkgver=0.1
pkgrel=1
pkgdesc="Console tag based file manager"
arch=(any)
url="https://gitlab.com/Nycroth/tag"
license=('custom:unlicense')
depends=('coreutils' 'sed' 'bash')
source=("https://gitlab.com/Nycroth/tag/repository/archive.tar.gz?ref=v0.1")
md5sums=('ded9086df4e24ec08c13f65726d818d8')

package() {
    cd "${srcdir}/${pkgname}.git"

    make DESTDIR="${pkgdir}" install
    install -m 755  -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
