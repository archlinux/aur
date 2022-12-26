# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname='beekeeper-studio-bin'
pkgver=3.7.10
pkgrel=1
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'aarch64')
url='https://www.beekeeperstudio.io'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=(beekeeper-studio)
conflicts=(beekeeper-studio)
source=(beekeeper-studio-3.7.10-license::https://github.com/beekeeper-studio/beekeeper-studio/raw/v3.7.10/LICENSE.md)
source_x86_64=(https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.7.10/beekeeper-studio_3.7.10_amd64.deb)
source_aarch64=(https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.7.10/beekeeper-studio_3.7.10_arm64.deb)
sha256sums=('1409fbbc5265c85da91684660c87f85d74c3fdc63a2d355169f40dac5cc7a078')
sha256sums_x86_64=('99151d1330e3d1432479ae9d0c72b052c9fe4194e6c9ccc85585eb897ac991fe')
sha256sums_aarch64=('5f1bb88074b17cf13c955567953a1bbfcc0498fb4209958c1422fc0882e5037c')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/Beekeeper Studio/beekeeper-studio" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/Beekeeper Studio/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/beekeeper-studio"
  install -Dvm644 "beekeeper-studio-3.7.10-license" "${pkgdir}/usr/share/licenses/beekeeper-studio/LICENSE"
}

