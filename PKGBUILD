# Maintainer: SharkEzz <icraft640@gmail.com>
# Co-Maintainer: guzzisti <rwagner at rw-net dot de>
# Contributor: James Bunton <jamesbunton@delx.net.au>


# The latest version can be found like this:
# $ curl -s https://bluejeans.com/downloads | grep 'desktop/linux'

pkgname=bluejeans
pkgver=2.30.1
_patchlevel=18
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
source=(BlueJeans-${pkgver}.rpm::https://swdl.bluejeans.com/desktop-app/linux/${pkgver}/BlueJeans_${pkgver}.${_patchlevel}.rpm)
sha256sums=('57fde79a29dd92e4e652cb80b9cd14c6574041eee37de5d649958f4d74f22eaf')

package() {
  # add bluejeans wrapper to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -nsf "/opt/BlueJeans/bluejeans-v2" "${pkgdir}/usr/bin/bluejeans"

  # move the rest of the files into the package directory
  mv "opt" "${pkgdir}/"
  mv "usr/share" "${pkgdir}/usr/"
}
