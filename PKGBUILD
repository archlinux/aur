# Maintainer: Seth Price <ssterling@firemail.cc>
pkgname=tmux-notify-git
pkgver=0.3.r0.g5f16767
pkgrel=1
pkgdesc="Simple tmux notification system written in sh"
arch=('any')
url="http://www.github.com/ssterling/tmux-notify/"
license=('MIT')
depends=('tmux')
makedepends=('git')
source=('git+http://github.com/ssterling/tmux-notify.git')
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -DT -m755 tmux-notify.sh "${pkgdir}/usr/bin/tmux-notify"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}"
    install -DT -m644 tmux-notify.conf "${pkgdir}/etc/tmux-notify/example_config.conf"
}
