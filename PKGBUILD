# Maintainer: aman <amankumarmatta0@gmail.com>

pkgname=unityhub-bin
pkgver=3.15.4
pkgrel=2
pkgdesc="Unity Hub is a desktop application for managing Unity Editor installations, projects, modules, licenses, and related resources."
arch=('x86_64')
url="https://unity.com/"
license=('custom')

depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
  'cpio'
  'libxml2-legacy'
  '7zip'
  'zip'
  'unzip'
  'tar'
)

source=("unityhub-3.15.4.deb::https://hub.unity3d.com/linux/repos/deb/pool/main/u/unity/unityhub_amd64/UnityHubSetup-3.15.4-amd64.deb")
sha256sums=('4557902db7d03a49f94b3a0f5ba6e3ae769135f94f7157f0fa0aeac4c5338206')

options=('!strip' '!debug')
provides=('unityhub')
conflicts=('unityhub' 'unityhub-beta')

package() {
  cd "$srcdir"

  # Extract deb contents
  tar -xf data.tar.* -C "$pkgdir"

  # Create launcher
  mkdir -p "$pkgdir/usr/bin"
  ln -sf /opt/unityhub/unityhub "$pkgdir/usr/bin/unityhub"
}
