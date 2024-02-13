# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
pkgname=moondust-configpack-a2xt
pkgver=2024feb02
pkgrel=1
pkgdesc="Moondust Project's game configuration pack - A Second X Thing"
arch=('any')
url="http://talkhaus.raocow.com/"
license=('custom')
makedepends=('gawk' 'sed' 'curl')
provides=('moondust-configpack')
source=(
"http://wohlsoft.ru/projects/Moondust/_laboratory/config_packs/A2XT.zip"
)
sha512sums=(
"SKIP"
)

pkgver() {
    curl 'http://wohlsoft.ru/projects/Moondust/_laboratory/' | grep "Last update" | tail -1 | awk -F'update: ' '{print $2}' | awk -F' ' '{print $3$2$1}' | sed 's/,//' | sed 's/[A-Z]/\l&/g'
}

package() {
    mkdir -p "${pkgdir}/opt/moondust/configs/"
    mv "${srcdir}/A2XT" "${pkgdir}/opt/moondust/configs/A2XT"
}
