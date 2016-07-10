# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor:  Martin Wimpress <code@flexion.org>

_pkgname=xulrunner
pkgname=lib32-${_pkgname}
pkgver=32.0
pkgrel=1
pkgdesc="Mozilla Runtime Environment, 32-bit upstream build"
depends=('lib32-alsa-lib' 'lib32-dbus-glib' 'lib32-gtk2' 'lib32-libidl2'
         'lib32-nss' 'lib32-libxt')
arch=('x86_64')
url="https://developer.mozilla.org/en/docs/XULRunner"
license=('MPL')
source=("http://ftp.mozilla.org/pub/mozilla.org/${_pkgname}/releases/${pkgver}/runtimes/${_pkgname}-${pkgver}.en-US.linux-i686.tar.bz2")
sha256sums=('5e478fe6ece4926df117ea939f5dfdb4d781aca7f5116ccd9c9d50fa3081eeac')

package() {
    install -d -m 0755 "${pkgdir}/usr/lib32/"
    cp -av "${_pkgname}" "${pkgdir}/usr/lib32/${_pkgname}-${pkgver}"
    install -d -m 0755 "${pkgdir}/etc/ld.so.conf.d"
    echo "/usr/lib32/${_pkgname}-${pkgver}" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
