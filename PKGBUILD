# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=chromium-fullscreen
pkgver=1
pkgrel=7
pkgdesc="A script in order to run Chromium in fullscreen mode under the chromium user"
url=""
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
depends=('xorg-server' 'xorg-xinit' 'unclutter' 'chromium' 'xlogin-git')
install='chromium-fullscreen.install'
source=('chromium-fullscreen.sysuser'
        'chromium-fullscreen.xinitrc'
        'disable-x-frame-option-background.js'
        'disable-x-frame-option-manifest.json')
md5sums=('9e979fbdd1e4a5a04fd0e91ce6a9a7be'
         'b5fee3c827d9b9bd3a954dd1213c1525'
         'c700c36f4ea3e353c6d49df823561fc4'
         'f543ec018edbaf5533e6bddd5068ff54')

package() {
  # Copy autorun script
  install -Dm644 ${srcdir}/chromium-fullscreen.xinitrc "$pkgdir/home/chromium/.xinitrc"

  #Install sysuser config
  install -Dm644 ${srcdir}/chromium-fullscreen.sysuser "$pkgdir/usr/lib/sysusers.d/chromium-fullscreen.conf"

  # Copy the extensions files
  install -Dm644 ${srcdir}/disable-x-frame-option-background.js "$pkgdir/home/chromium/.extensions/disable-x-frame-option/background.js"
  install -Dm644 ${srcdir}/disable-x-frame-option-manifest.json "$pkgdir/home/chromium/.extensions/disable-x-frame-option/manifest.json"
}
