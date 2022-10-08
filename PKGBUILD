# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Evan H. Moore <evmoore43@gmail.com>
pkgname=gpu-passthrough-manager
pkgver=1.0
pkgrel=1
pkgdesc="GPU passthrough made easy."
arch=('x86_64')
url="https://github.com/uwzis/gpu-passthrough-manager"
license=('GPL')
groups=()
depends=('python3' 'qemu' 'virt-manager')
makedepends=('git' 'jsoncpp' 'glib'  'gtk' 'gcc')
install=
source=("git+$url")
md5sums=('SKIP')

build() {
	cd ${pkgname}
	sh ./Build.sh
}


package() {
	cd "$pkgname"
	mkdir -p ${pkgdir}/usr/share/${pkgname}
	cp -rf * ${pkgdir}/usr/share/${pkgname}
	install -Dm775 ./gpu-passthrough-manager "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"	
	

}
