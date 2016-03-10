# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# This package controls the backlight for coolmaster dominator keyboards. In
# windows this is done with the scroll lock key. This package is a work around
# we have a script that toggles the LED key(so you can bind to it with your
# keyboard settings. There is also an /etc/default/ option that sets the default
# state of the backlight after login. So far, we cannot set the backlight
# without X, or at the login screen. Contrib is welcome.

pkgname=coolmaster-keyboard
pkgver=4
pkgrel=1
pkgdesc="Control the backlight for Coolmaster Dominator keyboards"
url="http://aur.archlinux.org"
arch=('any')
license=('GPL3')
depends=('xorg-xset')
backup=('etc/default/keyboard_backlight')
install=${pkgname}.install
source=("90-coolmaster-keyboard.sh"
        "coolmaster_keyboard"
        "keyboard_led_toggle.sh"
)
sha256sums=('e34f8f969fe47809c3bc3f263f3fc592f816c1a0187ef37d32c414477d718a83'
            '7132b4c49badde6faef71a38091ac07a626c14c207c2f6c45c483fe9d814e0e0'
            'b1530f6056dfa28d72eadf78df50cd9736e0ff95241434719a2636d0fe775213')

package() {
  cd "${srcdir}"
  install -Dm755 90-coolmaster-keyboard.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/90-coolmaster-keyboard.sh"
  install -Dm644 coolmaster_keyboard "${pkgdir}/etc/default/coolmaster_keyboard"
  install -Dm755 keyboard_led_toggle.sh "${pkgdir}/usr/bin/keyboard_led_toggle.sh"
}


