# Maintainer: asas1asas200 <asas1asas200@gmail.com>
pkgname="chatgpt-desktop-bin"
pkgver="0.7.4"
pkgrel=1
pkgdesc="ChatGPT Desktop Application (Mac, Windows and Linux)"
arch=("x86_64")
url="https://github.com/sonnylazuardi/${pkgname/-bin/}"
makedepends=("binutils"
             "tar")
depends=("openssl-1.1"
         "webkit2gtk")
provides=("chatgpt-desktop=${pkgver}")
conflicts=('chatgpt-desktop')
license=("Apache")
source=("https://github.com/lencx/ChatGPT/releases/download/v${pkgver}/chat-gpt_${pkgver}_amd64.deb")
sha256sums=('06795e6e82d8a42be050eed5b4873c9757edb1352fb85496b47b7179c5b9a94c')
noextract=("chat-gpt_${pkgver}_amd64.deb")

prepare() {
	ar p chat-gpt_${pkgver}_amd64.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}

