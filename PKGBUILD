# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="RunJS is an JavaScript playground that auto-evaluates your code as you type and outputs the results to a console pane"
arch=("x86_64" "aarch64")
url="https://github.com/lukehaas/RunJS"
license=("Commercial")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_arm64.deb")
sha256sums_x86_64=('bd6c3d86e01c7b62f11193171f0038a80c5912eee1e1736fe6a18d3a7a839d20')
sha256sums_aarch64=('26c0634307a6d762ad663083bcb97c482c588639cdc00da959cac05a8451ad34')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
