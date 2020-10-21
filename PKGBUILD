# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-webfai-creator
pkgver=1.5.109~tux+02cb842
pkgrel=1
pkgdesc="TUXEDO WebFAI Creator is the easiest way to prepare an USB pendrive for TUXEDO’s own Fully Automated Installation (WebFAI)"
arch=(x86_64)
url="https://tuxedocomputers.com"
license=('apache')
options=(!strip)

depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'avahi' 'cairo' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'graphite' 'gtk3' 'harfbuzz' 'libcups' 'libdatrie' 'libepoxy' 'libpng' 'libthai' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'pango' 'pixman' 'wayland')
makedepends=('bzip2')

source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/${pkgname}/${pkgname}_${pkgver}-51_amd64.deb)
sha256sums=('24aa710cb95157ed6ea8eae9fe754b6de8a80286c5d4211be90609885acf0269')
sha512sums=('4d632fcd9d7f6f2f71244ef8585e204edd1acc4419b48811ddd19013185fcb7a62df1dedaf2e4a30eddebf2f9720658eb4a63e849cb625190faf7159cead5611')

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.bz2" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
  install -Dm755 "${srcdir}"/output/opt/TUXEDO\ WebFAI\ Creator/tuxedo-webfai-creator "${pkgdir}"/usr/bin/tuxedo-webfai-creator
}
