# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname='beekeeper-studio-bin'
pkgver=3.7.9
pkgrel=1
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'aarch64')
url='https://www.beekeeperstudio.io'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=(beekeeper-studio)
conflicts=(beekeeper-studio)
source=(beekeeper-studio-3.7.9-license::https://github.com/beekeeper-studio/beekeeper-studio/raw/v3.7.9/LICENSE.md)
source_x86_64=(https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.7.9/beekeeper-studio_3.7.9_amd64.deb)
source_aarch64=(https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.7.9/beekeeper-studio_3.7.9_arm64.deb)
sha256sums=('1409fbbc5265c85da91684660c87f85d74c3fdc63a2d355169f40dac5cc7a078')
sha256sums_x86_64=('d940f6289f626511bca4001e8977efb1455c60fea41e0b6aab5c4398bee1d96e')
sha256sums_aarch64=('8966f24bf0519c5075396c66de8e0483ba63cfa2cc898ed5668287db26693ed5')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/Beekeeper Studio/beekeeper-studio" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/Beekeeper Studio/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/beekeeper-studio"
  install -Dvm644 "beekeeper-studio-3.7.9-license" "${pkgdir}/usr/share/licenses/beekeeper-studio/LICENSE"
}

