# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helmrelease-tools
pkgname=$_pkgname
pkgver=1.2.0
pkgrel=1
pkgdesc="ZSH functions to work with flux HelmReleases"
license=('APACHE')
arch=('x86_64')
depends=("yq" "git" "helm" "fd" "ripgrep" "helm-diff")
source=("$pkgname.plugin.zsh" "_$pkgname")
sha512sums=('d80c0293397052132e8aabccc90ce75a573c5332f0b2f6b16fbfd8ed3322ba70512f2a4b86a87b48da0ffb639fd4fdc85a2e55a381b551524fd3fe848316c017'
            'ff7a5fa4111c6e83a00b9e6731b6bfb6770600ed371d11f1347566fd81e7eb9e21993b9187012b426b4ae2080117953910bf75fc0b67ab1f345e7a702e3e2aa5')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -t $pkgdir/usr/share/zsh/plugins/$pkgname/ $srcdir/$pkgname.plugin.zsh
  install -D -t $pkgdir/usr/share/zsh/site-functions $srcdir/_$pkgname
}

#vim: syntax=sh
