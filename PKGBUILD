# Maintainer: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname='beekeeper-studio-bin'
pkgver=3.9.9
pkgrel=1
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'aarch64')
url='https://www.beekeeperstudio.io'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=(beekeeper-studio)
conflicts=(beekeeper-studio)
source=("beekeeper-studio-${pkgver}-license::https://github.com/beekeeper-studio/beekeeper-studio/raw/v${pkgver}/LICENSE.md")
source_x86_64=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/beekeeper-studio_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/beekeeper-studio_${pkgver}_arm64.deb")

sha256sums=('1409fbbc5265c85da91684660c87f85d74c3fdc63a2d355169f40dac5cc7a078')
sha256sums_x86_64=('3de158269726d7afcb2a5228855ac3d3ca34dbe6954b99552d4728e9a6ca7d1e')
sha256sums_aarch64=('4eb6e8df69ce9712f44a72589ba2ffe25c605667b6f82b21dcd343ad6a8074ae')


package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/Beekeeper Studio/beekeeper-studio" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/Beekeeper Studio/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/beekeeper-studio"
  install -Dvm644 "beekeeper-studio-${pkgver}-license" "${pkgdir}/usr/share/licenses/beekeeper-studio/LICENSE"
}
