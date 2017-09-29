# Maintainer: Ecmel B. CANLIER <aur@admicos.cf>
pkgname=userfirefox-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI program to manage Firefox userChrome.css changes."
url="https://github.com/Admicos/userfirefox"
arch=("any")
license=('GPLv3')
depends=("python" "python-requests")
source=("userFirefox::git+https://github.com/Admicos/userfirefox" "ufox.sh")
md5sums=('SKIP'
         '3145ba7dd5cb2f7669ea8ae9634f407d')

package() {
	mkdir -p "$pkgdir/usr/share/userFirefox"
	mkdir -p "$pkgdir/usr/bin"

	rm "userFirefox/.git" -r
	rm "userFirefox/.gitignore"

	chmod +x "ufox.sh"

	cp "userFirefox" "$pkgdir/usr/share" -r
	cp "ufox.sh" "$pkgdir/usr/bin/ufox"
}
