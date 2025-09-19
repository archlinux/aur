pkgname=chromap
chromap_ver=0.3.2
pkgver=$chromap_ver
pkgrel=1
pkgdesc="An ultrafast method for aligning and preprocessing high throughput chromatin profiles. "
arch=('x86_64')
license=('custom:"Copyright (c) 2019 Haowen Zhang, Li Song, X. Shirley Liu, Heng Li"')
url="https://haowenz.github.io/chromap/"
depends=()
provides=("$pkgname")
conflicts=("$pkgname")
optdepends=()

file_name=${pkgname}-${pkgver}
xz_name=$file_name.xz

source=(
	"https://mirrors.sustech.edu.cn/git/fc-ibb105/aur/-/raw/main/$xz_name"
)

chromap_sum=489706456caceb5ed23b854429efd82c9dc6517992b3c9075aaffcfc3e7e8f8beb6cad2d6c7e07839057861b02787549be9d02e884c8397686141a81f1c214e9
sha512sums=(
	$chromap_sum
)

package() {
	export LC_ALL=en_US.UTF-8

	mkdir -p $pkgdir/usr/bin
	#xz -d $xz_name
	mv $file_name $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
}
