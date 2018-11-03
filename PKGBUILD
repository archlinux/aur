# Maintainer: Katie Wolfe <katie@dnaf.moe>

pkgname=linerider-advanced
pkgver=1.04
pkgrel=1
pkgdesc="An open source spiritual successor to the flash game Line Rider 6.2 "
arch=("x86_64")
url="https://github.com/jealouscloud/linerider-advanced"
license=("GPL3")
depends=("mono")
makedepends=("unzip")
source=("https://github.com/jealouscloud/linerider-advanced/releases/download/v${pkgver}/linerider104.zip"
        "linerider-advanced-launcher")
md5sums=('fadba49887d4c2fc7bc6afd8e8a787af'
         '168c15cb67944b893f4dbdd87cec4c32')
provides=("linerider-advanced")
conflicts=("linerider-advanced")

package() {
	# Wrapper script
	install -d "$pkgdir/usr/bin"
	install -m755 "linerider-advanced-launcher" "$pkgdir/usr/bin/${pkgname}"

	# Install binaries and stuff to /opt/
	cd "$srcdir/linerider"
	install -d "$pkgdir/opt/${pkgname}"
	cp -a "."  "$pkgdir/opt/${pkgname}"
	chmod 755 "$pkgdir/opt/${pkgname}/linerider.exe"

}
