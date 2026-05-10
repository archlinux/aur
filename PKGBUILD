# Maintainer: Anand <your-github-username>
pkgname=vectorx-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="High-intensity GPU/CPU stress tester (Electron/WebGL)"
arch=('x86_64')
url="https://github.com/AnandRiftYT/VectorX_Benchmarker"
license=('MIT')
depends=('electron' 'libxss' 'nss')

# UPDATED LINK HERE:
source=("https://github.com/AnandRiftYT/VectorX_Benchmarker/releases/download/VectorX_v.1.0.0_First_Stable_Release/VectorXBenchmark-cpu-linux-x64.zip")
sha256sums=('cf81579c1dab59070f428c872ac7adff6e11a5ed2d880e111640bef2fc0f1a28')

package() {
    # This must match the folder name inside the ZIP
    cd "${srcdir}/VectorXBenchmark-cpu-linux-x64"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -r . "${pkgdir}/opt/${pkgname}/"

    # Create the terminal command 'vectorx'
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/VectorXBenchmark" "${pkgdir}/usr/bin/vectorx"
}
