# Maintainer: Axel Navarro <navarroaxel at gmail>
_name=delta
_pkgname="git-$_name"
pkgname="$_pkgname-bin"
pkgver=0.8.1
pkgrel=1
pkgdesc='A viewer for git and diff output'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/dandavison/delta'
license=('MIT')
provides=('git-delta')
conflicts=('git-delta' 'git-delta-git')
source=("$_pkgname-$pkgver.tgz::$url/archive/$pkgver.tar.gz")
source_i686=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_i386.deb")
source_x86_64=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_amd64.deb")
source_armv7h=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_armhf.deb")
source_aarch64=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('e478acf90c1125af0cfcb055c1e2b358080d192fbf83cf5ddfa40241830ab826')
sha256sums_i686=('de95b450454be1fb410f5f17dd379f70ad03e291d9f6a9a57181a36d3041747d')
sha256sums_x86_64=('47595f9b1e7731673b75cdee71156cd009f8b2c4812270c6e39d358ca75d01da')
sha256sums_armv7h=('f7f9b30a7548c18dac7363d3e937cc685456d25da44d83f2315ed6bad4ffac4d')
sha256sums_aarch64=('8e2ac5c7a09785b6dfbfdfdd5c0b1544224f7db02493c7db9aa1c05c7c04b2e1')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$_name-$pkgver/etc"
  install -Dm644 completion/completion.bash "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm644 completion/completion.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_name"
}
