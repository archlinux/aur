# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
pkgver=40.0.3
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
build=build1
ubuntu_ver=14.04.1
trisquel_ver=7.0trisquel40

sha256sums_i686=('f58dd96a5fe7124830ae326608e37fe36febd74d3ccfe2ebbbde6bb998eb5522')
sha256sums_x86_64=('782a98735efc893d6ae04141a93c3a38e967d5f402f5e604572e3fa904aac25b')
source_x86_64=("http://us.archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_amd64.deb")
source_i686=("http://us.archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_i386.deb")

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}

