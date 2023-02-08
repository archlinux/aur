# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helmrelease-tools
pkgname=$_pkgname
pkgver=1.0.0
pkgrel=0
pkgdesc="ZSH functions to work with flux HelmReleases"
license=('APACHE')
arch=('x86_64')
depends=("yq" "git" "helm" "fd" "ripgrep")
source=("$pkgname.plugin.zsh" "_$pkgname")
sha512sums=('74690739330f44b0be965e7ce2a2cccadfcb185f1679e2dd852f1bc068950b55b2ebd2e185bba6e5b8e4f4e6679b85f9b97fabb6c424d312e1d5ee4ec61767d6'
            'ff7a5fa4111c6e83a00b9e6731b6bfb6770600ed371d11f1347566fd81e7eb9e21993b9187012b426b4ae2080117953910bf75fc0b67ab1f345e7a702e3e2aa5')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -t $pkgdir/usr/share/zsh/plugins/$pkgname/ $srcdir/$pkgname.plugin.zsh
  install -D -t $pkgdir/usr/share/zsh/site-functions $srcdir/_$pkgname
}

#vim: syntax=sh
