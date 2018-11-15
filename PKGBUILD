# Maintainer: Philipp Jonczyk <p dot jonczyk at posteo dot de>
pkgname=python-signal-daemon
pkgver=1.0
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
md5sums=('f8315834d00678a0ed44ab0387b1264a')
source=("https://github.com/randomn4me/${pkgname#python-}/archive/${pkgver}.tar.gz")

package() {
    cd "${pkgname#python-}-${pkgver}"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/signal-daemon.py" \
        "${pkgdir}/usr/bin/signal-daemon"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
