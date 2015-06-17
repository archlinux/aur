# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
pkgver=38.0
pkgrel=1
pkgdesc="Binary version of Abrowser, safe and easy web browser from Mozilla"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://trisquel.info/en/wiki/abrowser-help"
depends=('gtk2' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss>=3.12.10' 'libxt'
         'libxrender' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib'
         'alsa-lib' 'libevent' 'sqlite3>=3.7.4' 'libnotify' 'desktop-file-utils'
         'libvpx' 'lcms' 'nspr>=4.8.8' 'libevent' 'libpng' 'cairo' 'gnome-vfs')

install=abrowser.install

s_pkgname=abrowser
build=build3
ubuntu_ver=14.04.1
trisquel_ver=7.0trisquel37

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='amd64'
  md5sums=('8cb184f85f15249f909d568923d6b5e9')
elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i386'
  md5sums=('b07472e8fe604d1e37e9e6d7fc994d10')
fi

source=("http://us.archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_${ARCH}.deb")

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}

