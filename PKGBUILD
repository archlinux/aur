# Maintainer: Manoel Vilela <manoel_vilela@engineer.com>
pkgname=xboxdrv-bin
_pkgname=xboxdrv
pkgver=0.8.8
pkgrel=2
pkgdesc="A precompiled Xbox360 joystick emulator with Playstation2 gamepad
config"
arch=('x86_64')
url="http://pingus.seul.org/~grumbel/xboxdrv"
license=('GPL')
depends=('libx11' 'dbus-glib' 'libusb' 'python2-dbus')
provides=('xboxdrv')
conflicts=('xboxdrv')
replaces=('xboxdrv')
backup=('etc/default/xboxdrv')
source=("https://www.dropbox.com/s/b9m78qyjyhatglx/xboxdrv.${pkgver}"
        "xboxdrv.default"
        "xboxdrv.openrc"
        "xboxdrv.1")
md5sums=('2865c2821450790d52984c90b1668d80'
         '9476a2f800ccc67d2574450d13999ff3'
         '8c9776a687b871d9e0d59ff4b3053838'
         '2d471a2aa0f81edecc9136a96e767d08')


package() {
  install -Dm 755 "${srcdir}/${_pkgname}.${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 755 "${srcdir}/${_pkgname}.openrc" "${pkgdir}/etc/init.d/${_pkgname}"
  install -Dm 644 "${srcdir}/${_pkgname}.default" "${pkgdir}/etc/default/${_pkgname}"
  install -Dm 644 "${srcdir}/xboxdrv.1" "${pkgdir}/usr/share/man/man1/xboxdrv.1"

}
