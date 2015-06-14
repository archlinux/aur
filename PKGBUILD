# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=python2-deepin-gsettings
pkgver=0.1.git20131206094009
_srcdirname=deepin-gsettings-0.1+git20131206094009~a64de3ac19
pkgrel=1
pkgdesc='deepin gsettings python bindings'
arch=('i686' 'x86_64')
depends=('python2-setuptools')
provides=('deepin-gsettings')
groups=('deepin')
url="https://gitcafe.com/Deepin/deepin-gsettings"
license=('GPL3')
provides=('deepin-gsettings')
replaces=('deepin-gsettings')
conflicts=('deepin-gsettings')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-gsettings/deepin-gsettings_0.1+git20131206094009~a64de3ac19.tar.gz")
sha256sums=('39225381934750aed1f768702c6c58307954eb329b617facb64f067d17a25e26')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build(){
  cd "${_srcdirname}"

  python2 setup.py build
}
package() {
  cd "${_srcdirname}"

  python2 setup.py install --root="$pkgdir" --optimize=1
}
