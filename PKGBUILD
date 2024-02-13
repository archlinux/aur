# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
pkgname=moondust-configpack-smbx38a
pkgver=2024feb02
pkgrel=1
pkgdesc="Moondust Project's game configuration pack - Super Mario Brothers X By 38A"
arch=('any')
url="http://wohlsoft.ru/forum/viewtopic.php?f=58&t=714"
license=('custom')
makedepends=('gawk' 'sed' 'curl')
provides=('moondust-configpack')
source=(
"http://wohlsoft.ru/projects/Moondust/_laboratory/config_packs/SMBXby38a_full.zip"
)
sha512sums=(
"SKIP"
)

pkgver() {
    curl 'http://wohlsoft.ru/projects/Moondust/_laboratory/' | grep "Last update" | tail -1 | awk -F'update: ' '{print $2}' | awk -F' ' '{print $3$2$1}' | sed 's/,//' | sed 's/[A-Z]/\l&/g'
}

package() {
    mkdir -p "${pkgdir}/opt/moondust/configs/"
    mv "${srcdir}/SMBX-38a" "${pkgdir}/opt/moondust/configs/SMBX-38a"
    chmod -R 755 "${pkgdir}/opt/moondust/configs/SMBX-38a"
}
