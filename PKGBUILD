# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
pkgver=55.0.2
pkgrel=1
pkgdesc="Binary version of Abrowser, safe and easy web browser from Mozilla"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://trisquel.info/en/wiki/abrowser-help"
depends=('gtk2' 'gtk3' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss>=3.12.10' 'libxt'
         'libxrender' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib'
         'alsa-lib' 'libevent' 'sqlite3>=3.7.4' 'libnotify' 'desktop-file-utils'
         'libvpx' 'lcms' 'nspr>=4.8.8' 'libevent' 'libpng' 'cairo')

s_pkgname=abrowser
build=build1
ubuntu_ver=16.04.1
trisquel_ver=8.0trisquel48

sha256sums_i686=('9246d290021393da96b340c14d71c40140a7c041c83743a82e163cff9e146185')
sha256sums_x86_64=('5d6e6edbed2a33edb91d146a3fd773dc94e06a0b183658a2bcaf29bcbfe10240')
source_x86_64=("http://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_amd64.deb")
source_i686=("http://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_i386.deb")

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}

