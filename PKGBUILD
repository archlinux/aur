pkgname=sakis3g
pkgver=0.2.0e
pkgrel=5
pkgdesc="An all-in-one script for connecting with 3G"
arch=(any)
url="http://www.sakis3g.com"
license=("GPL2")
depends=('ppp' 'net-tools')
optdepends=('usb_modeswitch: for switching USB modems'
            'kdialog: Graphical UI'
            'zenity: Graphical UI'
            'Xdialog: Graphical UI'
	    'libnewt: (whiptail) Text UI'
            'dialog: Text UI'
            'konsole: Terminal emulator'
            'xterm: Terminal emulator'
            '9menu: Simple and easily configurable X-menu / program launcher')
source=("http://www.sakis3g.com/downloads/sakis3g.tar.gz")
md5sums=('0b899cf94a027d329e49ef604029ebeb')

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "sakis3g" "$pkgdir/usr/bin"
}

post_install() {
  cat <<EOF
If no GUI is shown then try
export QT_X11_NO_MITSHM=1
before starting Xserver.

For using with sudo uncomment related to X11 settings
in the /etc/sudoers
EOF
}
