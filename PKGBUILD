# Maintainer: asas1asas200 <asas1asas200@gmail.com>
pkgname="chatgpt-desktop-bin"
pkgver="0.9.2"
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
sha256sums=('30f0a5ea6e1a3f11521f5a7e314fb7f5019437c80a89ca250c11a0d0ec55b3c7')
noextract=("chat-gpt_${pkgver}_amd64.deb")

prepare() {
	ar p chat-gpt_${pkgver}_amd64.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}

