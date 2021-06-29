# Maintainer: Axel Navarro <navarroaxel at gmail>
_name=delta
_pkgname="git-$_name"
pkgname="$_pkgname-bin"
pkgver=0.8.2
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
sha256sums=('b29db829a22f77538ce2e291e4c1b8f9aa7e714dbe5200c6353670a888b746d3')
sha256sums_i686=('595c70fb5e9dcc955240f67b4b7fea68387cb300c413fdf223432ee98fcea8ed')
sha256sums_x86_64=('232524950aa616ff8c3a882fe91cbb160d1a91a041cef13e85e9099fb4af6df2')
sha256sums_armv7h=('1f5b975d97e0e9f29386e3fd75c052242706a016eb29c827d519ca3a0423c31a')
sha256sums_aarch64=('f8765dec1e1b9fd46095df2901d52eaa16408549a4a28e56d83731afaea06621')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$_name-$pkgver/etc"
  install -Dm644 completion/completion.bash "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm644 completion/completion.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_name"
}
