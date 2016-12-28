# Maintainer: Daniel Wyatt <Daniel.Wyatt@gmail.com>
pkgname=hackhands-bin
pkgver=1.4.11
pkgrel=1
pkgdesc="An easy and convenient way to get notified and connect to requests on hackhands.com"
arch=('i686' 'x86_64')
url='https://hackhands.com'
license=('custom')
depends=('bash-completion'
         'desktop-file-utils'
         'gconf'
         'gtk2'
         'gvfs'
         'hicolor-icon-theme'
         'libappindicator-gtk2'
         'libnotify'
         'libsystemd'
         'libxtst'
         'nss'
         'xdg-utils')
optdepends=('gnome-keyring' 'libgnome-keyring')
options=('!strip')
source_i686=("https://packagecloud.io/hackhands/desktop/packages/ubuntu/xenial/hackhands_${pkgver}_i386.deb/download")
md5sums_i686=('3c67431b590758ff184c09191a4b6eb8')
source_x86_64=("https://packagecloud.io/hackhands/desktop/packages/ubuntu/xenial/hackhands_${pkgver}_amd64.deb/download")
md5sums_x86_64=('03ba9ab908eec8eac9d58886cfb6d2f1')

prepare() {
  tar -xJf data.tar.xz
  mv "usr/share/applications/desktop" "usr/share/applications/hackhands.desktop"
  sed -ie 's|/usr/share/HackHands/HackHands|HackHands|' "usr/share/applications/hackhands.desktop"
}

package() {
  cp -r "$srcdir/usr" "$pkgdir"
}

# vim:set ts=2 sw=2 et:
