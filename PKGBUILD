# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2675
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('i686' 'x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_i686=("https://wire-app.wire.com/linux/wire-${pkgver}-ia32.deb")
source_x86_64=("https://wire-app.wire.com/linux/wire-${pkgver}-amd64.deb")
sha256sums_i686=('d40a596454dd2272ea996b3647b57e6290d6112ea0a9ff66e7f9fc31096474a1')
sha256sums_x86_64=('3c1ac19b04790346b95aa61a27e581972f3b1784bfe05be836bbd57e9a6f7d9a')

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
