# Maintainer: éclairevoyant
# Contributor: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>

pkgname=y-cruncher
pkgver=0.8.1.9317
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems"
arch=(x86_64)
url="http://www.numberworld.org/$pkgname"
license=(custom)
options=('!strip')
depends=(gcc-libs glibc numactl tbb)
source=("$url/$pkgname%20v$pkgver-dynamic.tar.xz"
        "$pkgname.LICENSE"
)
b2sums=('295ce29002eff758773b1d250eadd679f4a9b633a8f068fa66b0593a19a24f0ddcef4ca213333360838a72d5e7c07c3fe9f44ff5c601d414ca11ed8b44fabf51'
        '54566d34c40a1ce90c19df611838a54c898f530b361c83998fc68103b108b5da4a03cd5616ffcdec5185c0fea2fc837ca2db337364d0d9c783ccbc746e9d92fc')

prepare() {
	mv "$pkgname v$pkgver-dynamic/Binaries/05-A64 ~ Kasumi" $pkgname
}

package() {
	install -vDm755 $pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 $pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
