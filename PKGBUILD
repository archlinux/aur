pkgname=sakis3g
pkgver=0.2.0e
pkgrel=4
pkgdesc="An all-in-one script for connecting with 3G"
arch=(any)
url="http://sourceforge.net/projects/vim-n4n0/?source=navbar"
license="GPL2"
depends=('ppp' 'net-tools')
optdepends=('usb_modeswitch: for switching USB modems'
            'kdialog: Graphical UI'
            'zenity: Graphical UI'
            'Xdialog: Graphical UI'
            'whiptail: Text UI'
            'dialog: Text UI'
            'konsole: Terminal emulator'
            'xterm: Terminal emulator'
            '9menu: Simple and easily configurable X-menu / program launcher')
source=("http://garr.dl.sourceforge.net/project/vim-n4n0/sakis3g.tar.gz")
md5sums=('2a040d7901b629d42718502eae6048e6')

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
