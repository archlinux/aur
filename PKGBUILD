# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=vlc-plugin-fluidsynth
pkgver=2.2.1
pkgrel=4
pkgdesc="FluidSynth plugin for VLC"
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1')
depends=('vlc' 'fluidsynth')
optdepends=("soundfont-fluid: FluidR3_GM soundfont"
            "soundfont-toh: Don Allen's Timbres of Heaven soundfont")
conflicts=("${pkgname}-git")
provides=("${pkgname}=${pkgver}")
install="notes.install"

source_i686=("${pkgname}.deb::http://ftp.us.debian.org/debian/pool/main/v/vlc/${pkgname}_${pkgver}-${pkgrel}_i386.deb")
source_x86_64=("${pkgname}.deb::http://ftp.us.debian.org/debian/pool/main/v/vlc/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
source=("notes.install")

md5sums_i686=('221cc6cca2507ee5f5584b2f757f040c')
md5sums_x86_64=('fa948b33dda99e25a2f17feaa07a1b86')
md5sums=('08522396ead8dc126392fea4a26a7940')

prepare() {
  cd "${srcdir}/"
  mkdir -p "${srcdir}/data/"
  tar -xf data.tar.xz -C "${srcdir}/data/"
}

package() {
  cd "${srcdir}/"
  
  install -Dm0755 "${srcdir}/data/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so" "$pkgdir/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so"
}
