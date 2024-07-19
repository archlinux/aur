# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=picacg-qt
pkgver=1.5.0
pkgrel=1
pkgdesc="PicACG Comic PC Client For Linux"
arch=('any')
url="https://github.com/tonquer/picacg-qt"
license=('LGPL3')
# https://github.com/tonquer/picacg-qt/blob/main/src/requirements.txt
depends=('pyside6'
         'python-websocket-client'
         'python-requests'
         'python-urllib3'
         'python-pillow'
         'python-pysocks'
         'python-natsort'
         'python-webdavclient3'
         'python-tqdm'
         'python-pysmb'
         'python-xcffib'
)
optdepends=('python-waifu2x-vulkan: Waifu2x-Vulkan support')
provides=('bika')
conflicts=('bika')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
)
sha256sums=('b256779fe3b49f9874d485fdfc840c1c663fb8c589fd5d6557977ddbe5ad116c'
            '2da544814d26a95d1b4f88e19b2957059d9bd3c074424cb6553eaf84ed71c765'
            '9c35b0e474517cbbf1b88dde5a5333e273a531e53657a839bd193a2f05842361')

build() {
  cd ${pkgname}-${pkgver}
  # nothing to do
}

package() {
  cd ${pkgname}-${pkgver}

  cd src
  find . -type f -exec \
                 install -Dm644 {} ${pkgdir}/usr/share/${pkgname}/{} \;
  
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
  install -Dm644 ../res/icon/icon_picacg.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}

# vim: set sw=2 ts=2 et:
