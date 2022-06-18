# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=2.4.1
pkgrel=2
pkgdesc="RunJS is an JavaScript playground that auto-evaluates your code as you type and outputs the results to a console pane"
arch=("x86_64" "aarch64")
url="https://github.com/lukehaas/RunJS"
license=("Commercial")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_arm64.deb")
sha256sums_x86_64=('1c301ea40f159731df2d64e7fb4f7671d2f6433efcfc6859ae1f4c1537c66f45')
sha256sums_aarch64=('97e987daa95363d19012082974e346f3b5a89a71be14520b5d05fc70d06c2d67')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
