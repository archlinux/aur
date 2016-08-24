# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=senpai
pkgver=1.0
pkgrel=1
pkgdesc="UCI compliant open source chess engine by Fabien Letouzey"
arch=('i686' 'x86_64')
url="http://www.chessprogramming.net/senpai/"
license=('GPL')
depends=('gcc-libs')
source=("$pkgname.zip::http://maughancdn.s3.amazonaws.com/chess/senpai/1.0/Senpai-1.0.zip")
md5sums=('9ffa2370f8fd7ffd643fc6dc85c99f9e')

build() {
	cd "${srcdir}/Source/"
	g++ -std=c++11 -march=native -pipe -O3 -finline-functions -funroll-all-loops -fno-rtti -lpthread -o senpai senpai_10.cpp
}

package() {
	cd "${srcdir}/Source/"
	install -Dm0755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
