# Maintainer: krforshey
pkgname=cosmic-ext-manager-bin
_pkgname=cosmic-ext-manager
pkgver=0.1.0
pkgrel=2
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
sha256sums=('9aa87b532a77473f8605e9c20841d95ec17a93fab3a85316bece9523efe065db')

package() {
  cd "$_pkgname-v$pkgver-x86_64-linux"
  install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 res/io.github.kevinRForshey.CosmicExtensionManager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm0644 res/io.github.kevinRForshey.CosmicExtensionManager.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm0644 res/io.github.kevinRForshey.CosmicExtensionManager.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
