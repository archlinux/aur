# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# This package controls the backlight for coolmaster dominator keyboards. In
# windows this is done with the scroll lock key. This package is a work around
# we have a script that toggles the LED key(so you can bind to it with your
# keyboard settings. There is also an /etc/default/ option that sets the default
# state of the backlight after login. So far, we cannot set the backlight
# without X, or at the login screen. Contrib is welcome

pkgname=coolmaster-keyboard
pkgver=1
pkgrel=1
pkgdesc="Control the backlight for Coolmaster Dominator keyboards"
url="http://aur.archlinux.org"
arch=('any')
license=('GPL3')
depends=('xorg-xset')
backup=('etc/default/keyboard_backlight')
install=${pkgname}.install
source=("90-keyboard-backlight.sh"
        "keyboard_backlight"
        "keyboard_led_toggle.sh"
)
sha256sums=('10d7549b18036df045ff1e94413d5e6de93a825da661b960c51935de503aec82'
            'b3dc05f6de9591eef0d66d575a7b15fa11b9cb5dcd166c3e4a94639290fe6779'
            '168f733e8308e7e711264f798ccb742456e0c2131841c471620b9e32fbc3f4c9')

package() {
  cd "${srcdir}"
  install -Dm755 90-keyboard-backlight.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/90-keyboard-backlight.sh"
  install -Dm644 keyboard_backlight "${pkgdir}/etc/default/keyboard_backlight"
  install -Dm755 keyboard_led_toggle.sh "${pkgdir}/usr/bin/keyboard_led_toggle.sh"
}


