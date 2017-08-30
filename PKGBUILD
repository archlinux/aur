# Maintainer: Christoph Brill <egore911@gmail.com>
pkgname=blender-plugin-meshlint-git
pkgver=1.0_r8ab0870
pkgrel=1
pkgdesc="A Blender Addon to help you keep your meshes clean and lint-free, like a spell-checker for your meshes."
arch=(any)
url="https://github.com/rking/meshlint"
license=('GPL')
depends=(blender)
makedepends=(git)
source=("meshlint::git+https://github.com/rking/meshlint.git")
md5sums=('SKIP')

pkgver() {
	cd meshlint
	printf "1.0_r%s" "$(git rev-parse --short HEAD)"
}

package() {
	cd meshlint
	addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
	install -dm755 ${addons}/meshlint
	install -m644 meshlint.py ${addons}/meshlint
}
