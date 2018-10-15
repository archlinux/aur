# Maintainer: Rellieberman <name AT gmail DOT com>
pkgname=blink-server
pkgver=1.0
pkgrel=1
pkgdesk="The desktop-side server needed in order to run the Blink Android Application"
arch=('any')
url="https://github.com/drpain/blink-server"
license=('MIT')
depends=('python2'
         'python2-pybluez'
         'xdottool'
         'bluez')
_sha=35f63810d600d2363c0c5ee0d375996ac99fdfba
_zipname="$pkgname-$pkgver"
source=("file://start_compat_mode.conf"
        "_zipname.zip::$url/archive/$_sha.zip")
sha256sum=('35f63810d600d2363c0c5ee0d375996ac99fdfba')


package() {
    mkdir ${pkgdir}/usr
    mkdir ${pkgdir}/usr/bin
    mkdir ${pkgdir}/etc
    mkdir ${pkgdir}/etc/systemd
    mkdir ${pkgdir}/etc/systemd/system
    mkdir ${pkgdir}/etc/systemd/system/bluetooth.service.d
    
    
    install -D -m644 "start_compat_mode.conf" "${pkgdir}/etc/systemd/system/bluetooth.service.d/start_compat_mode.conf"
    
    cd ${srcdir}
    install -D -m755 "bluetooth_server.py" "${pkgdir}/usr/bin/bluetooth_server.py"
    install -D -m755 "core.py" "${pkgdir}/usr/bin/core.py"
    
}
