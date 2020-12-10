# Maintainer: Alexis Jeandeau <alexis[dot]jeandeau[at]gmail[dot]com>

pkgname=flycasual-bin
pkgver=1.7
pkgrel=1
pkgdesc="Fan-made \"Star Wars: X-Wing Miniatures Game\" simulator"
arch=('x86_64')
url="https://github.com/Sandrem/FlyCasual"
license=('MIT')
depends=('gcc-libs'
         'zlib')

source=("https://github.com/Sandrem/FlyCasual/releases/download/${pkgver}/FlyCasual-v${pkgver}-Linux.zip"
        "https://raw.githubusercontent.com/Sandrem/FlyCasual/${pkgver}/LICENSE"
        'flycasual.sh'
        'flycasual.desktop')

sha256sums=('18d0e510a058ce8572d187555ded74cc63ca64e37ed8bba846a254a787cbd098'
            '615de0833ce2cdb29dd43d9f8214700ad8dd1d60e94392745eeb24b972a2b9e7'
            '07980d05ff1f158b381d5a903d98d593ed72b5ffaaa99ae481e2657ac2901c34'
            'a005a2dd3dde0ac5210ab509bbdf3f1eb453ca7da9992768848216422c643ba3')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/flycasual.sh" "${pkgdir}/usr/bin/flycasual"
  install -Dm755 "${srcdir}/Fly Casual/FlyCasual.x86_64" "${pkgdir}/opt/FlyCasual/FlyCasual"
  install -Dm644 "${srcdir}/Fly Casual/UnityPlayer.so" "${pkgdir}/opt/FlyCasual/"

  install -dm755 "${pkgdir}/opt/FlyCasual/FlyCasual_Data"
  cp -a "${srcdir}/Fly Casual/FlyCasual_Data/"* "${pkgdir}/opt/FlyCasual/FlyCasual_Data/"

  install -Dm644 "${srcdir}/flycasual.desktop" "${pkgdir}/usr/share/applications/flycasual.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
