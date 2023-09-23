# Maintainer: egoroff <egoroff@gmail.com>
pkgname=copyto-go-bin
pkgver=1.2.10
_app=copyto
pkgrel=3
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="copyto is a small command line app written in Go that allows you to easily one way sync between folders (binary release)"
url="https://github.com/aegoroff/copyto"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=(3ba48b213134a2cc06920fb4f272bab3f97f6a8377584d8af521344c1c19e7ac)
sha256sums_armv7h=(cb2271b040bb4f3c0fcde48d92167eaa129154700e35210c49f6f506e1dd0043)
sha256sums_aarch64=(5f2540981de0d490bd898f558a4f79ba908acff1209f5a8f5152b6bbfc501439)
build() {
	return 0
}

package() {
	conflicts=("copyto-go")

	install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
	install -Dm0555 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
	install -Dm0555 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
