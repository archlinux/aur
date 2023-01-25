# Maintainer: asas1asas200 <asas1asas200@gmail.com>
pkgname="chatgpt-desktop-bin"
pkgver="0.10.0"
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
source=("https://github.com/lencx/ChatGPT/releases/download/v${pkgver}/chat-gpt_${pkgver}_amd64.deb")
sha256sums=('8b1cacdd138c1d26bf913c63414146b321f697b6835dd5b19b86e6dce1ef422f')
noextract=("chat-gpt_${pkgver}_amd64.deb")

prepare() {
	ar p chat-gpt_${pkgver}_amd64.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}

