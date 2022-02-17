# Maintainer: Javier Coindreau <javster101@outlook.com>

pkgname="brickbench"
pkgver=0.3.2
pkgrel=2
pkgdesc='Map editor for Lego Star Wars: The Complete Saga'
arch=('x86_64')
license=('custom')
url='https://brickbench.opengg.dev/'
md5sums=('d055cfc005524a42cac46a686940c9df'
         '75f83ac48b5d34728f0b7e5b74a2dc34')

depends=('giflib' 'alsa-lib' 'libjpeg-turbo' 'libxtst' 'lcms2' 'libxrender' 'libnet')

source=(
    "https://github.com/BrickBench/BrickBench/releases/download/v${pkgver}/brickbench-${pkgver}-linux_x86_64.tar.gz"
    "BrickBench.desktop"
)

provides=(
    'brickbench'
)

options=()

package() {
    mkdir -p "${pkgdir}/opt/brickbench"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/bin"

    cp -R "${srcdir}/bin" "${pkgdir}/opt/brickbench"
    cp -R "${srcdir}/lib" "${pkgdir}/opt/brickbench"
    
    install -Dm0644 -t "${pkgdir}/usr/share/applications/" "BrickBench.desktop"

    ln -sf "/opt/brickbench/bin/brickbench" "${pkgdir}/usr/bin/brickbench"
}
