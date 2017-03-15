# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=chromium-fullscreen
pkgver=2
pkgrel=1
pkgdesc="A script in order to run Chromium in fullscreen mode under the chromium user"
url=""
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
depends=('xorg-server' 'xorg-xinit' 'unclutter' 'chromium' 'xlogin-git')
install='chromium-fullscreen.install'
source=('chromium-fullscreen.sysuser'
        'chromium-fullscreen.xinitrc'
        'disable-x-frame-option-background.js'
        'disable-x-frame-option-manifest.json'
        'aw-snap-reloader-background.js'
        'aw-snap-reloader-manifest.json')
md5sums=('9e979fbdd1e4a5a04fd0e91ce6a9a7be'
         'd95b5d1a926e4144984bb6761cae4217'
         'c700c36f4ea3e353c6d49df823561fc4'
         'f543ec018edbaf5533e6bddd5068ff54'
         'a2e49410d550e79ac9c0037121522387'
         'e6bb49bafce141806d28fe03efc862b0')

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
