# Maintainer: krforshey
pkgname=cosmic-ext-manager-bin
_pkgname=cosmic-ext-manager
pkgver=0.1.1
pkgrel=1
pkgdesc='Browse, install, update and remove community COSMIC extensions (prebuilt binary)'
arch=('x86_64')
url='https://github.com/kevinRForshey/CosmicExtensionManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('dfa1e6e9a79bdd972c449b836a8b304793bb4eed246b63d942d55a71371e880f')

package() {
  cd "$_pkgname-v$pkgver-x86_64-linux"
  install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 res/io.github.kevinRForshey.CosmicExtensionManager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm0644 res/io.github.kevinRForshey.CosmicExtensionManager.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm0644 res/io.github.kevinRForshey.CosmicExtensionManager.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
