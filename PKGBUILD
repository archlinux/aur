# Maintainer: Alexis Jeandeau <alexis[dot]jeandeau[at]gmail[dot]com>

pkgname=flycasual-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Fan-made \"Star Wars: X-Wing Miniatures Game\" simulator"
arch=('x86_64')
url="https://github.com/Sandrem/FlyCasual"
license=('MIT')
depends=('lib32-gtk2')

source=("https://github.com/Sandrem/FlyCasual/releases/download/${pkgver}/Linux.zip"
        'flycasual.sh'
        'flycasual.desktop')

sha256sums=('ec68cb397af6208ba535762faa4e84be5618257f7742a4604018d19ec4303091'
            '07980d05ff1f158b381d5a903d98d593ed72b5ffaaa99ae481e2657ac2901c34'
            'a005a2dd3dde0ac5210ab509bbdf3f1eb453ca7da9992768848216422c643ba3')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/flycasual.sh" "${pkgdir}/usr/bin/flycasual"
  install -Dm755 "${srcdir}/Linux/FlyCasual.x86" "${pkgdir}/opt/FlyCasual/FlyCasual"

  install -dm755 "${pkgdir}/opt/FlyCasual/FlyCasual_Data"
  cp -a "${srcdir}"/Linux/FlyCasual_Data/* "${pkgdir}/opt/FlyCasual/FlyCasual_Data/"

  install -Dm644 "${srcdir}/flycasual.desktop" "${pkgdir}/usr/share/applications/flycasual.desktop"
}
