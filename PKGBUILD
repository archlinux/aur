# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.7.1
pkgrel=3
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver-LICENCE::${url/github/raw.githubusercontent}/v$pkgver/LICENCE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('848714779efb65c3d6e7ef7964458b20f12a33d634551141f257427631078a7ee8da7c4773a2dbe46c1a52f6200cb3f4b007158d4a332d403d5d6a8d9facf2ed')
b2sums_i686=('1d38025a6da014aad04932ce883d56b7f8f45d7ef82537d8b304a1ce8aed7cf548376b8f3c78a77fbe0c4bb29b83128e15226e7e099643f85d6be2cc8e5c1105')
b2sums_aarch64=('1993ff40eae12135907c3d0eaf6746bddda7de0769dae02d4e9be429a3a5262341fe18264f2ad0cdd8a14bf5e11a6c7feafd318eff39ee1b12e53d5499598841')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver-LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
