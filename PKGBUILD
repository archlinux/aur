# Maintainer: Alexis Jeandeau <alexis[dot]jeandeau[at]gmail[dot]com>

pkgname=flycasual-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Fan-made \"Star Wars: X-Wing Miniatures Game\" simulator"
arch=('x86_64')
url="https://github.com/Sandrem/FlyCasual"
license=('MIT')
depends=('lib32-gtk2')

source=("https://github.com/Sandrem/FlyCasual/releases/download/${pkgver}/Linux.zip"
        'flycasual.sh'
        'flycasual.desktop')

sha256sums=('05e5cd0015f8dcf208b169069ecd4d4ad4e07fed4400f67bbbfe132c42d36257'
            '07980d05ff1f158b381d5a903d98d593ed72b5ffaaa99ae481e2657ac2901c34'
            'a005a2dd3dde0ac5210ab509bbdf3f1eb453ca7da9992768848216422c643ba3')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/flycasual.sh" "${pkgdir}/usr/bin/flycasual"
  install -Dm755 "${srcdir}/Linux/FlyCasual.x86_64" "${pkgdir}/opt/FlyCasual/FlyCasual"

  install -dm755 "${pkgdir}/opt/FlyCasual/FlyCasual_Data"
  cp -a "${srcdir}"/Linux/FlyCasual_Data/* "${pkgdir}/opt/FlyCasual/FlyCasual_Data/"

  install -Dm644 "${srcdir}/flycasual.desktop" "${pkgdir}/usr/share/applications/flycasual.desktop"
}
