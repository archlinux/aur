# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=xchat-se
pkgver=1.2.21
pkgrel=3
pkgdesc="An xchat fork with a few different features"
arch=('x86_64')
#license=('unknown')
url="https://xchat.servx.ru/"
options=('!strip')
provides=("xchat")
conflicts=('xchat')
# https://xchat.servx.ru/linux
source=('https://xchat.servx.org/linux/x86_64/linuxmint/stable/18/xchat-se_1.2.21-1_amd64.deb'
        'xchat-se.install')
md5sums=('16ef377b9e708a89968edf80f35c52ea'
         '8de528b549f6fffa56fb492162faed63')

depends=('gtk2'
         'openssl-1.0'
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
