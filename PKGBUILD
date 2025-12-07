# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=18.0rc1
pkgrel=2
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jre17-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
	"https://github.com/SlimeVR/SlimeVR-Server/releases/download/v18.0.0-rc.1/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
	"ab58362cb7ce93e31114d0b55d799001a9df7b6a1dbe83f45f91f84aafc400a96482cbd90489b6b05e2162c8eb75e2a06af2eb0c9dc07397cd36e6c68ab35dec"
)

package() {

  tar -xz -f data.tar.gz -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  mv "${pkgdir}/lib/udev/rules.d/69-slimevr.rules" "${pkgdir}/usr/lib/udev/rules.d/"
  rmdir "${pkgdir}/lib/udev/rules.d/"
  rmdir "${pkgdir}/lib/udev/"
  rmdir "${pkgdir}/lib/"
  rm "${startdir}/SlimeVR-amd64.deb"
}
