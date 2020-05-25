# Maintainer: SharkEzz <icraft640@gmail.com>
# Contributor: James Bunton <jamesbunton@delx.net.au>


# The latest version can be found like this:
# $ curl -s https://bluejeans.com/downloads | grep 'desktop/linux'

pkgname=bluejeans
pkgver=2.2.0
pkgrel=1
pkgdesc="BlueJeans desktop app for video calls"
arch=('x86_64')
url="https://www.bluejeans.com"
license=('Proprietary')
groups=()
depends=('alsa-lib'
         'atk'
         'bzip2'
         'cairo'
         'dbus'
         'dbus-glib'
         'expat'
         'fontconfig'
         'freetype2'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'graphite'
         'gtk2'
         'harfbuzz'
         'libcap'
         'libdatrie'
         'libdrm'
         'libffi'
         'libgcrypt'
         'libgl'
         'libgpg-error'
         'libnotify'
         'libpng'
         'libsystemd'
         'libthai'
         'libutil-linux'
         'libx11'
         'libxau'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxdmcp'
         'libxext'
         'libxfixes'
         'libxi'
         'libxinerama'
         'libxrandr'
         'libxrender'
         'libxshmfence'
         'libxtst'
         'libxxf86vm'
         'lz4'
         'mesa'
         'nspr'
         'nss'
         'pango'
         'pcre'
         'pixman'
         'pulseaudio'
         'wayland'
         'xz'
         'zlib')
install=bluejeans.install
source=(BlueJeans-${pkgver}.rpm::https://swdl.bluejeans.com/desktop-app/linux/${pkgver}/BlueJeans.rpm)
sha256sums=('89f2311d18ffb4c500e80652cd0a5606416630479c3bfee668403df160b28640')

package() {
  # add bluejeans wrapper to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -nsf "/opt/BlueJeans/bluejeans-v2" "${pkgdir}/usr/bin/bluejeans"

  # move the rest of the files into the package directory
  mv "opt" "${pkgdir}/"
  mv "usr/share" "${pkgdir}/usr/"
}
