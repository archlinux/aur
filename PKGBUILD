# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
pkgver=57.0
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
build=build4
ubuntu_ver=16.04.5
trisquel_ver=8.0trisquel51

sha256sums_i686=('7c32c69df0ef65eacd5c5239badfd40cdc81aa4f8a1a3d8db44373e50f0495d0')
sha256sums_x86_64=('e72846b04446d6a0645b01d9dcce7272e3590a34679a7801de7992e48d457e69')
source_x86_64=("http://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_amd64.deb")
source_i686=("http://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${build}-0ubuntu0.${ubuntu_ver}+${trisquel_ver}_i386.deb")

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}

