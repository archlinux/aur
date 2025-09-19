pkgname=pandepth
pkgver=2.26
pkgrel=1
pkgdesc="PanDepth, an ultrafast and efficient genomic tool for coverage calculation"
arch=('x86_64')
license=('MIT')
url="https://github.com/HuiyangYu/PanDepth"
depends=()
provides=("$pkgname")
conflicts=("$pkgname")
optdepends=()

file_name=${pkgname}-${pkgver}
xz_name=$file_name.xz

source=(
	"https://mirrors.sustech.edu.cn/git/fc-ibb105/aur/-/raw/main/${pkgname}-${pkgver}.xz"
)

pandepth_sum=126907e912abc6d2f37931502f2599af2174addae8dddbdb26573909da797c85b3c8587ee4da5bebb1b5a7b4ac13c2ac7c9fb46e3c44fae9d81b2690a34104e7
sha512sums=(
	$pandepth_sum
)

package() {
	export LC_ALL=en_US.UTF-8

	mkdir -p $pkgdir/usr/bin
	#xz -d $xz_name
	mv $file_name $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
}
