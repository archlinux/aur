# Maintainer: krforshey
pkgname=cosmic-applet-manager-bin
_pkgname=cosmic-applet-manager
pkgver=0.2.0
pkgrel=1
pkgdesc='Browse, install, update and remove community COSMIC extensions (prebuilt binary)'
arch=('x86_64')
url='https://github.com/kevinRForshey/CosmicAppletManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('4e57e4b22c82f42f0ab51a4b5862bb0d8c61376363048d8b311dea78b59e2223')

package() {
  cd "$_pkgname-v$pkgver-x86_64-linux"
  install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 res/io.github.kevinRForshey.CosmicAppletManager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm0644 res/io.github.kevinRForshey.CosmicAppletManager.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm0644 res/io.github.kevinRForshey.CosmicAppletManager.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
