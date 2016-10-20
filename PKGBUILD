# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2663
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_i686=("https://wire-app.wire.com/linux/wire-${pkgver}-ia32.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire-${pkgver}-amd64.deb")
sha256sums_i686=('53fee4593d95b956abf67753decab9ec54945f1154034c598e7c1a794cdd925c')
sha256sums_x86_64=('8feded93907e176345461c412bcc1b7682055c2ff9411c99fe05be686865ce1b')

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="ia32"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  deb_package="wire-${pkgver}-${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"
}
