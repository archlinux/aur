# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=vcard-studio-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A contact management application with support for vCard file format (.vcf)."
arch=('x86_64')
url="https://app.zdechov.net/vcard-studio"
provides=("vcard-studio=${pkgver}")
conflicts=("vcard-studio")
license=('CC0')
makedepends=()
depends=('at-spi2-core' 'glibc' 'gdk-pixbuf2' 'glib2' 'libx11' 'cairo' 'pango' 'gtk2')
source=("https://svn.zdechov.net/vcard-studio/bin/deb/vcard-studio_${pkgver}_amd64.deb")
sha256sums=('33689bdae3eedf74b29713289e5653fe55c07132bb2f862bf901ffc126c83bb1')

prepare() {
  rm control.tar.zst
  rm debian-binary
  tar xf data.tar.zst
}

package() {
  cp -Rfp $srcdir/usr $pkgdir/
}
