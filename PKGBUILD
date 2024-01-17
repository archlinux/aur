# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=zsh-defer
pkgname=$_pkgname-git
pkgver=r39.1c75faf
pkgrel=1
pkgdesc='Deferred execution of Zsh commands'
arch=('any')
url='https://github.com/romkatv/zsh-defer'
license=('GPL-3.0-or-later')
depends=('zsh')
makedepends=('git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	install -Dvm644 zsh-defer.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$_pkgname/"
}
