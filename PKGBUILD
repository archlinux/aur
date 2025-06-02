# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.1_alpha.8
pkgrel=1
pkgdesc='An extremely fast Python type checker and language server, written in Rust.'
arch=('aarch64' 'armv7' 'i686' 'x86_64')
url='https://github.com/astral-sh/ty'
depends=('glibc' 'gcc-libs')
license=('MIT')
provides=('ty')

_baseurl="https://github.com/astral-sh/ty/releases/download/${pkgver//_/-}"

source_aarch64=("${_baseurl}/ty-aarch64-unknown-linux-gnu.tar.gz")
source_armv7=("${_baseurl}/ty-armv7-unknown-linux-gnueabihf.tar.gz")
source_i686=("${_baseurl}/ty-i686-unknown-linux-gnu.tar.gz")
source_x86_64=("${_baseurl}/ty-x86_64-unknown-linux-gnu.tar.gz")

source=('https://raw.githubusercontent.com/astral-sh/ty/refs/heads/main/LICENSE')

sha256sums_aarch64=('a36fb5587187aaf615c64b2c02935d4ecb9e36bb19ef42d601ecc9f0852d3957')
sha256sums_armv7=('6292070626bc8e2e65693c9667b876132af21c6839313cef636c66849151a491')
sha256sums_i686=('b9ce56c3a0fb9195a8ed467e4afedec5491a2534529b1317f2e583871dffd449')
sha256sums_x86_64=('90960759c0240efdbc2b2253c0fa983d62f162dc67c8b99e3cec476c72f53e37')

sha256sums=('860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c')

package() {
	install -Dm755 "ty-${CARCH}-unknown-linux-gnu/ty" "${pkgdir}/usr/bin/ty"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
