# Maintainer: Anand <AnandRiftYT>
pkgname=vectorx-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="High-intensity GPU/CPU stress tester (Electron/WebGL)"
arch=('x86_64')
url="https://github.com/AnandRiftYT/VectorX_Benchmarker"
license=('MIT')
depends=('electron' 'libxss' 'nss')

source=("https://github.com/AnandRiftYT/VectorX_Benchmarker/releases/download/VectorX_v.1.1.0_Stable_Release/VectorXBenchmark-cpu-linux-x64.zip")
sha256sums=('640a9229fa036b9222403f55693481eafceb4e4edae6b78ac15ca9b2502315ec')

package() {

    install -dm755 "${pkgdir}/opt/${pkgname}"


    cp -r "${srcdir}/VectorXBenchmark-cpu-linux-x64/." "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"

    echo -e "#!/bin/bash\ncd /opt/${pkgname} && ./VectorXBenchmark --disable-gpu-shader-disk-cache --no-sandbox \"\$@\"" > "${pkgdir}/usr/bin/vectorx"

    chmod +x "${pkgdir}/usr/bin/vectorx"
}
