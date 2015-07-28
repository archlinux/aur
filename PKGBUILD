# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-screenshot
pkgver=3.0.14.12.20150717162046
_srcdirname=deepin-screenshot-14.12+git20150717162046~d869601900
pkgrel=2
pkgdesc="Easy-to-use screenshot tool for linuxdeepin desktop environment"
arch=('any')
url="https://gitcafe.com/Deepin/deepin-screenshot"
license=('GPL3')
makedepends=('deepin-gettext-tools')
groups=('deepin-extra')
install="${pkgname}.install"
source=("http://ftp5.gwdg.de/pub/linux/linuxdeepin/packages/pool/main/d/deepin-screenshot/deepin-screenshot_14.12+git20150717162046~d869601900.tar.gz")
sha256sums=('0058f6aadcd17e8b40b3b6279fc40d9298b7c16950e4416a392cc1dd6443f75f')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find src -type f | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build() {
  cd "${_srcdirname}"

  make
}

package() {
  depends=('deepin-menu' 'deepin-qml-widgets' 'pygtk'
           'python2' 'python2-pyqt5' 'python2-wnck' 'xpybutil')

  cd "${_srcdirname}"
  make DESTDIR="${pkgdir}" install
}

 # Local Variables:
 # sh-basic-offset: 2
 # End:
