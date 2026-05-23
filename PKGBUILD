# Maintainer: Damian Nowak <spam at nowaker dot net>
pkgname=bun-profile-bin
pkgver=1.3.14
pkgrel=1
pkgdesc="Bun JavaScript runtime - PROFILE build with debug symbols + linker map for use with perf/Instruments. Side-by-side install with extra/bun."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
depends=('glibc')
options=('!debug' '!strip')

source_x86_64=("bun-linux-x64-profile-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64-profile.zip")
sha256sums_x86_64=('f51a04e19e59a256fc82e8612c2996e0fefef6c16dbb7f9395cbd5dad9bdbf3e')

package() {
  install -Dm755 "${srcdir}/bun-linux-x64-profile/bun-profile" "${pkgdir}/usr/bin/bun-profile"
  install -Dm644 "${srcdir}/bun-linux-x64-profile/features.json" "${pkgdir}/usr/share/bun-profile/features.json"
  install -Dm644 "${srcdir}/bun-linux-x64-profile/bun-profile.linker-map" "${pkgdir}/usr/share/bun-profile/bun-profile.linker-map"
}
