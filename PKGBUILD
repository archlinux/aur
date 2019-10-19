# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=chromium-fullscreen
pkgver=3
pkgrel=4
pkgdesc="A script in order to run Chromium in fullscreen mode under the chromium user"
url="https://aur.archlinux.org/packages/chromium-fullscreen/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
depends=('xorg-server' 'xorg-xinit' 'xorg-xset' 'xorg-xrandr' 'unclutter' 'chromium' 'xlogin-git')
install='chromium-fullscreen.install'
source=('https://raw.githubusercontent.com/julianxhokaxhiu/AUR/master/chromium-fullscreen/chromium-fullscreen.sysuser'
        'https://raw.githubusercontent.com/julianxhokaxhiu/AUR/master/chromium-fullscreen/chromium-fullscreen.xinitrc'
        'https://raw.githubusercontent.com/julianxhokaxhiu/AUR/master/chromium-fullscreen/disable-x-frame-option-background.js'
        'https://raw.githubusercontent.com/julianxhokaxhiu/AUR/master/chromium-fullscreen/disable-x-frame-option-manifest.json'
        'https://raw.githubusercontent.com/julianxhokaxhiu/AUR/master/chromium-fullscreen/aw-snap-reloader-background.js'
        'https://raw.githubusercontent.com/julianxhokaxhiu/AUR/master/chromium-fullscreen/aw-snap-reloader-manifest.json')

package() {
  # Copy autorun script
  install -Dm644 ${srcdir}/chromium-fullscreen.xinitrc "$pkgdir/home/chromium/.xinitrc"

  #Install sysuser config
  install -Dm644 ${srcdir}/chromium-fullscreen.sysuser "$pkgdir/usr/lib/sysusers.d/chromium-fullscreen.conf"

  # Copy the extensions files
  install -Dm644 ${srcdir}/disable-x-frame-option-background.js "$pkgdir/home/chromium/.extensions/disable-x-frame-option/background.js"
  install -Dm644 ${srcdir}/disable-x-frame-option-manifest.json "$pkgdir/home/chromium/.extensions/disable-x-frame-option/manifest.json"
  install -Dm644 ${srcdir}/aw-snap-reloader-background.js "$pkgdir/home/chromium/.extensions/aw-snap-reloader/background.js"
  install -Dm644 ${srcdir}/aw-snap-reloader-manifest.json "$pkgdir/home/chromium/.extensions/aw-snap-reloader/manifest.json"
}
