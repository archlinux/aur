# Maintainer: laptander <dev-laptander a|t yandex d|o|t ru>

_gitroot="https://github.com/bluezio/ipwebcam-gst.git"
_gitname="ipwebcam-gst"
_gitbranch="master"
pkgname=ipwebcam-gst-git
pkgver=r46.a179d03
pkgrel=1
pkgdesc="Use Android smartphone as webcam and/or microphone"
arch=('i686' 'x86_64')
url="https://github.com/bluezio/ipwebcam-gst"
license=('GPL')
depends=('android-tools' 'v4l2loopback-dkms' 'mawk' 'v4l-utils' 'gstreamer' 'gst-plugins-good')
provides=('prepare-videochat')
conflicts=('prepare-videochat')
source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m755 "${srcdir}/${_gitname}/prepare-videochat.sh" "${pkgdir}/usr/bin/prepare-videochat"
}
