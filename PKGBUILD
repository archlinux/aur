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
source_i686=("https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/i386/palemoon_${pkgver}-${pkgrel}.gtk3_i386.deb")
source_aarch64=("https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/arm64/palemoon_${pkgver}-${pkgrel}.gtk3_arm64.deb")
source=("https://repo.palemoon.org/MoonchildProductions/Pale-Moon/src/branch/master/palemoon/branding/official/palemoon.desktop")
options=("!strip")
sha256sums=(SKIP)
sha256sums_x86_64=('b4bd6dcfc29d04160e830facb3512381451f11ea1f99c86f7b094bd0fefca434')
sha256sums_i686=('cc5457442aa1a3c809ca4b0ee88c8a03ddbc9eb4a7ab8444c92d76618f52db5f')
sha256sums_aarch64=('59f9eba59197737c481006bb19723c703c1a06808aeaff178e8f81730ace049b')

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -Dm644 "${srcdir}/palemoon.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
