# Maintainer: Axel Navarro <navarroaxel at gmail>
_name=delta
_pkgname="git-$_name"
pkgname="$_pkgname-bin"
pkgver=0.8.0
pkgrel=2
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
sha256sums=('706b55667de221b651b0d938dfbb468112b322ed41a634d3ca5c8bd861b19e8a')
sha256sums_i686=('c51c45b88bfa2076da2ee88896f7b3441262699ebfc1f39777a6f297493790c0')
sha256sums_x86_64=('6a0fe847b3003d564e20beb3749d342804022842de1cfbac7c42631f730db194')
sha256sums_armv7h=('afaa922a8eccd723f52c54e402e467409ebaeeb9552d6f44f2463b94bfeb0266')
sha256sums_aarch64=('94cfee3eb3c9703878fde07de548cf0a00e085cb57d5cc9e1758d5b387dee013')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$_name-$pkgver/etc"
  install -Dm644 completion/completion.bash "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm644 completion/completion.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_name"
}
