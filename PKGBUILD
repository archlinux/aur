# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
pkgver=41.0
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
trisquel_ver=7.0trisquel41

sha256sums_i686=('4c4d48a2a9a680b301ccc76eb235100dd7dfd4a3dc47cf64c8f75386099f56f0')
sha256sums_x86_64=('cff9fdef3d6b0ac04278e7f3c817c67b56a40a5fa8bc141e077561e44ce493fd')
source_x86_64=("http://us.archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_amd64.deb")
source_i686=("http://us.archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_i386.deb")

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}

