# Maintainer: Anand <AnandRiftYT>
pkgname=vectorx-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="High-intensity GPU/CPU stress tester (Electron/WebGL)"
arch=('x86_64')
url="https://github.com/AnandRiftYT/VectorX_Benchmarker"
license=('MIT')
depends=('electron' 'libxss' 'nss')

source=("https://github.com/AnandRiftYT/VectorX_Benchmarker/releases/download/VectorX_v.1.0.0_First_Stable_Release/VectorXBenchmark-cpu-linux-x64.zip")
sha256sums=('cf81579c1dab59070f428c872ac7adff6e11a5ed2d880e111640bef2fc0f1a28')

package() {

    install -dm755 "${pkgdir}/opt/${pkgname}"


    cp -r "${srcdir}/VectorXBenchmark-cpu-linux-x64/." "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"

    echo -e "#!/bin/bash\ncd /opt/${pkgname} && ./VectorXBenchmark --disable-gpu-shader-disk-cache --no-sandbox \"\$@\"" > "${pkgdir}/usr/bin/vectorx"

    chmod +x "${pkgdir}/usr/bin/vectorx"
}
