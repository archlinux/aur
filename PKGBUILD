# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.0.7
pkgrel=2
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/i89ArVsgEmE/ngrok-v3-3.0.7-linux-amd64")
source_i686=("https://bin.equinox.io/a/3QpkwQSwP4Q/ngrok-v3-3.0.7-linux-386")
source_armv7h=("https://bin.equinox.io/a/56h7JKtaKfK/ngrok-v3-3.0.7-linux-arm")
source_aarch64=("https://bin.equinox.io/a/eHMpaFdWsTq/ngrok-v3-3.0.7-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('e16d389d622d3c230b832c858a72f4ed80c0263c4bb12351a4e7056999cebdf4')
sha256sums_x86_64=('8e39fea4f473b2fdb961fe1ca39161d441a0a052e9c8c78affe5a35a84048b66')
sha256sums_armv7h=('84b982c9e9a779b7eae593280cb52396ef3a4333094abd87ae7f28c60c16b5e3')
sha256sums_aarch64=('164094266e1a7ce164f84873cd5b2863d9113e659f52aaa4b6332d99df0f3e9e')

# In order to make Ngrok's built-in updater happy, we need to avoid modifying the binary
options=(!strip)

package() {
  # Copy terms of service to license directory
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" TERMS-OF-SERVICE.txt

  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
