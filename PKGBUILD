# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: 0xsapphir3 <0xsapphir3@gmail.com>
pkgname=gitcolorscripts-bin
pkgver=r19.5c5e449
pkgrel=1
pkgdesc="Get your GitHub contributions right in your terminal!"
arch=(any)
url="https://github.com/BladeOfLightX/gitcolorscripts"
license=('MIT')
depends=(cargo)
provides=(gitcolorscripts)
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/gitcolorscripts"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    find gitcolorscripts/bin \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

	install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
