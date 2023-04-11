# Maintainer: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname='beekeeper-studio-bin'
pkgver=3.9.6
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
sha256sums_x86_64=('5835ffdab9fa85e7c0b4fd9f1f680d17b977a53251fd1381bf71898636a1cdca')
sha256sums_aarch64=('c755f953901c0472b0588610548c60bf409c9f7e1b0f2bf82b11eebec45483f3')


package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/Beekeeper Studio/beekeeper-studio" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/Beekeeper Studio/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/beekeeper-studio"
  install -Dvm644 "beekeeper-studio-${pkgver}-license" "${pkgdir}/usr/share/licenses/beekeeper-studio/LICENSE"
}
