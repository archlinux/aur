# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=python2-deepin-utils
pkgver=0.0.2.20140703165416
_srcdirname=deepin-utils-0.0.2+20140703165416~8aaf2a6f00
pkgrel=1
pkgdesc='Basic utils for all project in Linux Deepin.'
arch=('i686' 'x86_64')
url="https://gitcafe.com/Deepin/deepin-utils"
groups=('deepin')
depends=('deepin-pygtk' 'python2-cairo' 'freetype2' 'webkitgtk2'
         'python2-xlib' 'pywebkitgtk')
makedepends=('python2-setuptools')
license=('GPL3')
provides=('deepin-utils')
replaces=('deepin-utils' 'deepin-utils-git')
conflicts=('deepin-utils' 'deepin-utils-git')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-utils/deepin-utils_0.0.2+20140703165416~8aaf2a6f00.tar.gz")
sha256sums=('823380c71cba9d3ccb7815e6c445d0c2e4955d88164551c3e3c4ba7d084cf51b')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build() {
  cd "${_srcdirname}"

  python2 setup.py build
}

package() {
  cd "${_srcdirname}"

  python2 setup.py install --root="$pkgdir" --optimize=1
}
