# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2673
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_i686=("https://wire-app.wire.com/linux/wire-${pkgver}-ia32.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire-${pkgver}-amd64.deb")
sha256sums_i686=('218d637621f940eaffde2f1f1e72ae54a1911c8cb9a071c326616ce33e7b142d')
sha256sums_x86_64=('67718bce1acac9791f3eec391491920e829d41801f0232064c7283b012fc37f8')

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
