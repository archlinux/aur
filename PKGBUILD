# Maintainer: Mahid Sheikh <mahidsheikh@pm.me>
# Contributor: Eric Lu 
pkgname=clyde-aur-git
_pkgname=clyde
pkgver=30.42d76d8
pkgrel=1
pkgdesc="Simple AUR helper written in Bash"
arch=(any)
url="https://github.com/StandingPadAnimations/clyde"
depends=(jq)
makedepends=(git)
source=("git+https://github.com/StandingPadAnimations/clyde")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	# Uncomment if you use Doas
	# sed -i 's/sudo/doas/' "$_pkgname/clyde"

	# Standard install
	install -D -t "$pkgdir/usr/bin" "$_pkgname/clyde"
	install -D -t "$pkgdir/usr/share/bash-completion/completions" "$_pkgname/completions/clyde"

	# Uncomment if you use Zsh
	# install -D -t "$pkgdir/usr/local/share/zsh/site-functions" "$_pkgname/completions/_clyde"  
}
