# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-screenshot
pkgver=3.0.20150508154858
_srcdirname=deepin-screenshot-3.0+20150508154858~a5ed48140f
pkgrel=1
pkgdesc="Easy-to-use screenshot tool for linuxdeepin desktop environment"
arch=('any')
url="https://gitcafe.com/Deepin/deepin-screenshot"
license=('GPL3')
makedepends=('deepin-gettext-tools')
groups=('deepin-extra')
install="${pkgname}.install"
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-screenshot/deepin-screenshot_3.0+20150508154858~a5ed48140f.tar.gz")
sha256sums=('be7b95af98b0830c107c20814e9ac25419defe951a211499ee7530b3d7d44e5a')

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
  depends=('deepin-menu' 'deepin-qml-widgets' 'deepin-pygtk'
           'python2' 'python2-pyqt5' 'python2-wnck' 'xpybutil')

  cd "${_srcdirname}"
  make DESTDIR="${pkgdir}" install
}

 # Local Variables:
 # sh-basic-offset: 2
 # End:
