# Maintainer: Philipp Schaffrath <philipp dot schaffrath at gmail dot com>

pkgname=giph
pkgver=1.1.1
pkgrel=1
pkgdesc='video recorder that records the desktop, a window or a selection'
url='https://github.com/phisch/giph'
license=('MIT')
arch=('any')
depends=('bash' 'ffmpeg' 'xdotool')
optdepends=('slop: for interactive selection'
            'libnotify: for error and success notifications'
            'procps-ng: for pgrep used in the --stop flag')
makedepends=('git')
provides=('giph')
conflicts=('giph')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('138ee2b6a023a2d61ff8ad3d0be0228914140d2d0f18d90202ab5e46bec3a22a')

package() {
    cd "$pkgname-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}