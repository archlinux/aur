# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=python-signal-daemon
pkgver=1.3
pkgrel=1
pkgdesc="A daemon to process input of signal-cli using the system dbus"
arch=('any')
url="https://github.com/randomn4me/python-signal-daemon/"
license=('ISC')
depends=('python'
         'signal-cli'
         'python-pydbus')
source=("signal-daemon.py")
provides=("python-signal-daemon=$pkgver-$pkgrel")
md5sums=('af823c47b3b5df98b28b8e8816416725')
source=("https://github.com/randomn4me/${pkgname#python-}/archive/${pkgver}.tar.gz")

package() {
    cd "${pkgname#python-}-${pkgver}"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/signal-daemon.py" \
        "${pkgdir}/usr/bin/signal-daemon"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
