# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname=palemoon-deb-gtk3-bin
pkgver=32.4.0.1
pkgrel=1
pkgdesc="An Open Source, Goanna-based web browser focusing on efficiency and customization."
arch=("x86_64" "i686" "aarch64")
url="http://www.palemoon.org/"
license=("MPL2" "LGPL2.1" "LGPL3" "GPL3")
provides=("${pkgname%-deb-gtk3-bin}")
conflicts=("${pkgname%-deb-gtk3-bin}")
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'alsa-lib' 'startup-notification' 'unzip' 'zip' 'yasm' 'libpulse' 'gcc' 'openssl-1.1')
makedepends=('xz')
source_x86_64=("https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/amd64/palemoon_${pkgver}-${pkgrel}.gtk3_amd64.deb")
source_i686=("https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/amd64/palemoon_${pkgver}-${pkgrel}.gtk3_i386.deb")
source_aarch64=("https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/amd64/palemoon_${pkgver}-${pkgrel}.gtk3_arm64.deb")
source=("https://repo.palemoon.org/MoonchildProductions/Pale-Moon/src/branch/master/palemoon/branding/official/palemoon.desktop")
options=("!strip")
sha256sums=(SKIP)
sha256sums_x86_64=('b4bd6dcfc29d04160e830facb3512381451f11ea1f99c86f7b094bd0fefca434')
sha256sums_i686=('62938ed46eb79f2203342f5ee610761ec0514827263245a5b30a120a86662ecd')
sha256sums_aarch64=('1ffc9744b30ec0948831c1bf37ea22e0f916e103860c4d213cac24ffb166903b')

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -Dm644 "${srcdir}/palemoon.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
