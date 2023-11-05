# Maintainer: shurizzle <shura1991@gmail.com>

pkgname=otf-commit-mono
pkgver=1.141
pkgrel=1
pkgdesc="An anonymous and neutral programming typeface focused on creating a better reading experience."
arch=(any)
url='https://commitmono.com/'
license=('custom:SIL Open Font License v1.1')
source=("commit-mono.zip::https://github.com/eigilnikolajsen/commit-mono/releases/download/v${pkgver}/CommitMono-${pkgver}.zip")
sha256sums=('900842dfce51d3090797d432d7a672ce5ef890a03706cf114da15518c504c553')

package() {
    local size weight srcdir fontdir

    srcdir="CommitMono-${pkgver}"
    fontdir="/usr/share/fonts/OTF"
    fontdir="${pkgdir}${fontdir}"

    install -dm 755 "${fontdir}"
    for size in 400 700; do
        for weight in Regular Italic; do
            install -m 644 "${srcdir}/CommitMono-${size}-${weight}.otf" \
                "${fontdir}/CommitMono-${size}-${weight}.otf"
        done
    done
    install -Dm644 "${srcdir}/license.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
