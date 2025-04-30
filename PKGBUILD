# Maintainer: Your Name <your.email@example.com>

pkgname=void-bin
pkgver=1.99.30001
pkgrel=1
arch=('x86_64')
options=('!strip')
url="https://github.com/voideditor/binaries"
license=('APACHE')
depends=('libxkbfile' 'gnupg' 'gtk3' 'libsecret' 'nss' 'gcc-libs' 'libnotify' 'libxss' 'glibc' 'lsof' 'shared-mime-info' 'xdg-utils' 'alsa-lib')
source=("https://github.com/voideditor/binaries/releases/download/${pkgver}/Void-linux-x64-${pkgver}.tar.gz" 'void' 'void.desktop')
md5sums=('69c1c2224e773cf542381bb5b0d40869'
         '3d713b95d192d05587d6ea1b3f231d42'
         '107766a74bf62464161810549cd8929a')

package() {
  mkdir -p "$pkgdir/opt/void"
  tar -xzf "${srcdir}/Void-linux-x64-${pkgver}.tar.gz" -C "$pkgdir/opt/void"

  mkdir -p $pkgdir/usr/bin/
  install -Dm755 void $pkgdir/usr/bin/

  mkdir -p $pkgdir/usr/share/applications/
  install -Dm644 void.desktop $pkgdir/usr/share/applications/
}
