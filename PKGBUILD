pkgname=confedi-git-bin
pkgver=1
pkgrel=1
pkgdesc="Confedi is designed to help with changing configuration files with one command."
arch=(any)
license=('GPL')
depends=(python3)
makedepends=(git pyinstaller)
url="https://bitbucket.org/masterofhoppips/configuration-editor.git"
source=("git+$url")
md5sums=('SKIP')

build(){
	pyinstaller configuration-editor/src/program.py -F
}

package() {
	mkdir -p "$pkgdir"/usr/bin
	cp configuration-editor/src/dist/program "$pkgdir"/usr/bin/$pkgname
}
