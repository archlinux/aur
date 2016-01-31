# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# This package controls the backlight for coolmaster dominator keyboards. In
# windows this is done with the scroll lock key. This package is a work around
# we have a script that toggles the LED key(so you can bind to it with your
# keyboard settings. There is also an /etc/default/ option that sets the default
# state of the backlight after login. So far, we cannot set the backlight
# without X, or at the login screen. Contrib is welcome

pkgname=coolmaster-keyboard
pkgver=3
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
sha256sums=('84e9af948178a4f3a4054f87a17adf0f5ba23845b4a0a98900344c261612ef66'
            '5949356d3a44ba4d5431c9ff461e9f6cc1e0b89ae8fc9c29d8b9f4aeec0dd230'
            '168f733e8308e7e711264f798ccb742456e0c2131841c471620b9e32fbc3f4c9')

package() {
  cd "${srcdir}"
  install -Dm755 90-coolmaster-keyboard.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/90-coolmaster-keyboard.sh"
  install -Dm644 coolmaster_keyboard "${pkgdir}/etc/default/coolmaster_keyboard"
  install -Dm755 keyboard_led_toggle.sh "${pkgdir}/usr/bin/keyboard_led_toggle.sh"
}


