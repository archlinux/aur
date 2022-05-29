# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=pridefetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Neofetch clone written in Python with the ability to display pride flags"
arch=('any')
url="https://github.com/Spyhoodle/pridefetch"
source=("git+https://github.com/Spyhoodle/pridefetch#tag=v$pkgver")
depends=('python3' 'python-distro')
makedepends=('git' 'zip')
sha512sums=('SKIP')

package() {
	cd $pkgname/src
	zip -r ../pridefetch.zip *
	cd ..
	echo "#!/usr/bin/env python" | cat - pridefetch.zip > pridefetch
	install -Dm755 pridefetch "$pkgdir"/usr/bin/pridefetch
}
