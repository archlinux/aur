# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=magmax-bin
_pkgname=magmax
pkgver=1.4.0
pkgrel=1
pkgdesc="Enhance genome recovery across metagenomic assemblies, from dereplication to enrichment"
arch=('x86_64')
url="https://github.com/soedinglab/MAGmax"
license=('GPL-3.0-only')
provides=("magmax=$pkgver")
conflicts=('magmax')
options=('!strip' '!debug')
source=(
    "https://github.com/soedinglab/MAGmax/releases/download/v${pkgver}/magmax"
    "https://raw.githubusercontent.com/soedinglab/MAGmax/v${pkgver}/LICENSE.md"
)
sha256sums=('bd79027487d0e46543fd068186775825d1a4d31fe9df1f5f51e4f0b761a1f7b1'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
