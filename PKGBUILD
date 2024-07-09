pkgname=hevi
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern hex viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/Arnau478/hevi"
license=('GPL3')
provides=('hevi')
source_x86_64=("hevi-x86_64-${pkgver}"::"https://github.com/Arnau478/hevi/releases/download/v${pkgver}/hevi-x86_64-linux")
source_aarch64=("hevi-aarch64-${pkgver}"::"https://github.com/Arnau478/hevi/releases/download/v${pkgver}/hevi-aarch64-linux")
sha256sums_x86_64=('bdc1d4798319d80316d296fe519e5a68afe45779dc8657d4fee17d944673aeb9')
sha256sums_aarch64=('4e36d6840ee00d947fc3959c568af502ed9bb7787bffffc960294709b2e2d4c1')

package() {
    cd $srcdir

    if [ "${CARCH}" == "aarch64" ]; then
        install -Dm755 "hevi-aarch64-${pkgver}" "${pkgdir}/usr/bin/hevi"
    else
        install -Dm755 "hevi-x86_64-${pkgver}" "${pkgdir}/usr/bin/hevi"
    fi
}

