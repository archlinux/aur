# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.7.2
pkgrel=1
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
b2sums_x86_64=('3464cea0f95ffd74cf95fd51eba9a973aebbd35e210c9ddd1b41dca98f34d8618fb1de236b5062082054a716a9508578df3b1330de973215cd6714668243c997')
b2sums_i686=('a0511fa676dc570cc4da30b8241a1d03a16affda229e3f30f93c54d0f193ac0923e1007fb3662518885900aac497cb4922b91986cf28ddaca04d97887e4b9eca')
b2sums_aarch64=('a0c9588dc9f9e9d26c74f73c6ad60fd9391ddca24b7be34ea9cab66869ab65a4efc967b7ab788352b18adcdde0a9ae9618038db6c5144f234e63d1ab8454ea6e')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver-LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
