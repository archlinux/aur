# Maintainer: Deep-sea <3800907852@qq.com>
# Maintainer: LuoTianyi_arm64 <2153585992@qq.com>
pkgname=02engine-bin
provides=('02engine')
pkgver=1.2.3
fullver=1.2.3-3315b4af
pkgrel=1
source=(".INSTALL::https://github.com/02engine/02engine-aur/releases/download/INSTALL/INSTALL"
        "02engine-${pkgver}.deb"::"https://github.com/02engine/desktop/releases/download/v${fullver}/02Engine-linux-amd64-${pkgver}.deb")
pkgdesc='Redefine the designing experience.'
arch=('x86_64')
url='https://github.com/02engine/'
license=('GPL3')
depends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'util-linux-libs'  'libappindicator' 'xdg-utils')
sha256sums=('2565e60d233d653206f33fc25b35c7b31b42d45c5fb1de7b28be966fae959d58'
            'DEBSSHA')
build() {
  cd "$srcdir"
  bsdtar -xf "02engine-${pkgver}.deb"
  bsdtar -xf "data.tar.xz"
}

package() {
  cp -r "$srcdir/opt" "$pkgdir"
  cp -r "$srcdir/usr" "$pkgdir"
}
