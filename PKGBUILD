# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
# Maintainer: orhun <orhunparmaksiz@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=bob-bin
pkgver=2.8.3
pkgrel=1
pkgdesc="A version manager for neovim"
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/MordechaiHadad/bob/releases/download/v${pkgver}/bob-linux-x86_64.zip"
	           "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
	           "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('e1ffbd0e3f39be3847c896a9256922e7fc7acec01bb8d0eb5def7821b1d421b7afdceaa84b0564417816c764cd4b0523b561a90d6ccb518486196b96360626b4'
                   '88b112def47f8b8e9fe085c362061faf7284860bb88f7666a94e5bb2b63c41ad8b0fb1921f99ba1b1bd3e28b88f4dc585327e88a992f2dc345cb2771784bead3'
                   '5dac462b34d7dd4b06d1adaec60125e566a2f00a108aaf734c29ac5f3e18c943fd63316b15627570ccdb779f77e6b55315a48180e827cd6807acf59dc1d6a2f2')

package() {
	install -Dm 755 "${pkgname%-bin}-linux-x86_64/${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
