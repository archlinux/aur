# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helmrelease-tools
pkgname=$_pkgname
pkgver=1.4.0
pkgrel=1
pkgdesc="ZSH functions to work with flux HelmReleases"
license=('APACHE')
arch=('x86_64')
depends=("yq" "git" "helm" "fd" "ripgrep" "helm-diff")
source=("$pkgname.plugin.zsh" "_$pkgname")
sha512sums=('055b4336a47292d4b73761933c9d0f1cd3aa26cdadda462dc7b1fe965c06681167f5b55f8e6fd1282e7aee1ccc06f9251799d7cb7ad8dc96e1493ee8f7b552cb'
            'ff7a5fa4111c6e83a00b9e6731b6bfb6770600ed371d11f1347566fd81e7eb9e21993b9187012b426b4ae2080117953910bf75fc0b67ab1f345e7a702e3e2aa5')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -t $pkgdir/usr/share/zsh/plugins/$pkgname/ $srcdir/$pkgname.plugin.zsh
  install -D -t $pkgdir/usr/share/zsh/site-functions $srcdir/_$pkgname
}

#vim: syntax=sh
