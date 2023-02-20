# Maintainer: asas1asas200 <asas1asas200@gmail.com>
pkgname="chatgpt-desktop-bin"
pkgver="0.11.0"
pkgrel=1
pkgdesc="ChatGPT Desktop Application (Mac, Windows and Linux)"
arch=("x86_64")
url="https://github.com/lencx/ChatGPT"
makedepends=("binutils"
             "tar")
depends=("openssl-1.1"
         "webkit2gtk")
provides=("chatgpt-desktop=${pkgver}")
conflicts=('chatgpt-desktop')
license=("Apache")
source=("https://github.com/lencx/ChatGPT/releases/download/v${pkgver}/ChatGPT_${pkgver}_linux_${arch}.deb")
sha256sums=('90e56e19b0fb637627d2c6053cbff00f1e141a8a179a2cf9c4fab3e4147a6a26')
noextract=("chat-gpt_${pkgver}_amd64.deb")

prepare() {
	ar p ChatGPT_${pkgver}_linux_${arch}.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}

