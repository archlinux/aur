# Maintainer: Simon <contact at swz dot works>
pkgname=rlbotgui-rust-bin
git_pkgname=rlbot_gui_rust
cargo_pkgname=rl-bot-gui
pkgver=1.0.16
pkgrel=1
pkgdesc="A Rust GUI for the RLBot framework"
arch=("x86_64")
url="https://github.com/VirxEC/rlbot_gui_rust"
conflicts=("rlbotgui-rust-git")

depends=("python")

license=("custom")

source=("$pkgname-$pkgver.tar.gz::https://github.com/VirxEC/${git_pkgname}_apt/releases/download/v${pkgver}/linux-basics.tar.gz")
sha512sums=(SKIP)

package() {
  cd $srcdir/deb
  ls
  cd $(ls | grep ${cargo_pkgname}_${pkgver})
  ls
  cd data
  ls

  debdatapath=$(pwd)

  install -Dm755 "${debdatapath}/usr/bin/$cargo_pkgname" "${pkgdir}/usr/bin/$cargo_pkgname"
  install -Dm755 "${debdatapath}/usr/share/applications/${cargo_pkgname}.desktop" "${pkgdir}/usr/share/applications/${cargo_pkgname}.desktop"
  install -Dm755 "${debdatapath}/usr/share/icons/hicolor/192x192/apps/${cargo_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${cargo_pkgname}.png"
}
