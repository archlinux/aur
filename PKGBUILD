# Maintainer: johnpyp <johnpyp.dev@gmail.com>
pkgname=audiobookconverter-bin
pkgver=5.5.18
pkgrel=1
epoch=
pkgdesc="Improved AudioBookConverter based on freeipodsoftware release (mp3 to m4b converter)"
arch=("x86_64")
url="https://github.com/yermak/AudioBookConverter"
license=('GPL2')
groups=()
depends=(
	"glibc"
  "alsa-lib"
  "at-spi2-atk"
  "at-spi2-core"
  "atk"
  "cairo"
  "dbus"
  "desktop-file-utils"
  "fontconfig"
  "freetype2"
  "gdk-pixbuf2"
  "glib2"
  "graphite"
  "gtk2"
  "gtk3"
  "harfbuzz"
  "hicolor-icon-theme"
  "libbsd"
  "libdatrie"
  "libepoxy"
  "libgcrypt"
  "libgl"
  "libglvnd"
  "libgpg-error"
  "libpng"
  "libselinux"
  "libthai"
  "libx11"
  "libxau"
  "libxcb"
  "libxcomposite"
  "libxcursor"
  "libxdamage"
  "libxdmcp"
  "libxext"
  "libxfixes"
  "libxi"
  "libxinerama"
  "libxkbcommon"
  "libxrandr"
  "libxrender"
  "libxtst"
  "lz4"
  "pcre"
  "pixman"
  "systemd-libs"
  "util-linux-libs"
  "wayland"
  "xdg-utils"
  "zlib"
)
provides=('audiobookconverter')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/yermak/AudioBookConverter/releases/download/version_${pkgver}/audiobookconverter_${pkgver}-${pkgrel}_amd64.deb"
        "audiobookconverter-bin.install")
sha512sums=('f5bca205e4357711e930978759ae475fe201c65d74301083cb9d8ec6db59037e77e45b3970aedbead646fa8a914c02390e648f2e239cd44e395d1517893a2055'
            '620d4d55985dfca088918e0daede656b158fa199c64f03f365c9305fef239e2d2eb82cd15e9de3ad63fb891efdeb4c1faf6487b6e88f73f97b1b6de97b8471f3')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

  install -dm0755 "${pkgdir}/usr/bin"
  ln -sf "/opt/audiobookconverter/bin/AudioBookConverter" "${pkgdir}/usr/bin/audiobookconverter"

  cp -dpr --no-preserve=ownership "${pkgdir}/opt/audiobookconverter/lib" "${pkgdir}/usr/lib"

  install -Dm644 "${pkgdir}/opt/audiobookconverter/lib/audiobookconverter-AudioBookConverter.desktop" "${pkgdir}"/usr/share/applications/audiobookconverter.desktop
}
