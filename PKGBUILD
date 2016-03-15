# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=xchat-se
pkgver=1.2.15
pkgrel=1
pkgdesc="An xchat fork with a few different features"
arch=('x86_64')
#license=('unknown')
url="https://xchat.servx.ru/"
options=('!strip')
provides=("xchat")
conflicts=('xchat')
# https://xchat.servx.ru/linux
source=('https://xchat.servx.ru/linux/xchat-se_1.2.15-1_amd64.deb'
        'xchat-se.install')
md5sums=('6f7324429929d79341ec99cb76b26d60'
         '8de528b549f6fffa56fb492162faed63')

depends=('gtk2'
         'openssl'
         'dbus-glib'
         'libnotify')
optdepends=('enchant: for spell checking support'
            'perl: for perl plugin'
            'tcl: for tcl plugin'
            'python2: for python plugin')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  # Remove extra keywords line from desktop file
  sed -i '0,/^Keywords=.\+/! {/^Keywords=.\+/d}' "${pkgdir}/usr/share/applications/xchat.desktop"

}