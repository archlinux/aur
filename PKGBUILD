# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=2.10.1
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
sha256sums_x86_64=('eb02ce164f58e0c737b0e71503753cecf31bd15fc70b918b5017ce90bea37ce7')
sha256sums_aarch64=('20d9db51432f39089f6d6bf827e7ce3c0fd685a35d8a5bd8e3e9400f3ef027b0')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
