# Maintainer: Philipp Schaffrath <aur at philipp dot schaffrath dot email>

pkgname=giph
pkgver=1.0
pkgrel=1
pkgdesc='gif recorder that records the desktop, a window or a selection'
url='https://github.com/phisch/giph'
license=('MIT')
arch=('any')
depends=('bash' 'ffmpeg' 'xdotool')
optdepends=('slop: for interactive selection'
            'libnotify: for error and success notifications')
makedepends=('git')
provides=('giph')
conflicts=('giph')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('5500f7e8ac35cfbfbeff829013f13998f2c3fc1ba1faff32eb5e5d643ca1c647')

package() {
    cd "$pkgname-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}