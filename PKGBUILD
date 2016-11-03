# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2666
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_i686=("https://wire-app.wire.com/linux/wire-${pkgver}-ia32.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire-${pkgver}-amd64.deb")
sha256sums_i686=('c67f57f1b008a7185508f016d22f57c55a6307908979d6ce474301acf2a6b1bd')
sha256sums_x86_64=('7ecae0965bf0b037f81d4f32aaef677ffc5436598f478ffd94a214816f9fd756')

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
