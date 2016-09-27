# Author: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=chromium-fullscreen
pkgver=1
pkgrel=4
pkgdesc="A script in order to run Chromium in fullscreen mode under the chromium user"
url=""
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
depends=('xorg-server' 'xorg-xinit' 'unclutter' 'chromium' 'xlogin-git')
install='chromium-fullscreen.install'
source=('chromium-fullscreen.sysuser'
        'chromium-fullscreen.xinitrc')
md5sums=('9e979fbdd1e4a5a04fd0e91ce6a9a7be'
         '7f2ce7a70ebb06b9b8ff0e222f08bb37')

package() {
  # Copy autorun script
  install -Dm644 ${srcdir}/chromium-fullscreen.xinitrc "$pkgdir/home/chromium/.xinitrc"

  #Install sysuser config
  install -Dm644 ${srcdir}/chromium-fullscreen.sysuser "$pkgdir/usr/lib/sysusers.d/chromium-fullscreen.conf"
}
