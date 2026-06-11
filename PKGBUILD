# Maintainer: Anand <Anand-Rift>
pkgname=vectorx-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="High-intensity GPU/CPU stress tester (Electron/WebGL)"
arch=('x86_64')
url="https://github.com/Anand-Rift/VectorXBenchmarker"
license=('MIT')
depends=('electron' 'libxss' 'nss')

source=("https://github.com/Anand-Rift/VectorX_Benchmarker/releases/download/VectorX_v.2.0.0_Major_Release/VectorXBenchmark-cpu-linux-x64.zip")
sha256sums=('635f45f0a126d79f23ce7fa9656acea45610be9f7b03d8f86420cb67617a6598')

package() {

    install -dm755 "${pkgdir}/opt/${pkgname}"


    cp -r "${srcdir}/VectorXBenchmark-cpu-linux-x64/." "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"

    echo -e "#!/bin/bash\ncd /opt/${pkgname} && ./VectorXBenchmark --disable-gpu-shader-disk-cache --no-sandbox \"\$@\"" > "${pkgdir}/usr/bin/vectorx"

    chmod +x "${pkgdir}/usr/bin/vectorx"
}
