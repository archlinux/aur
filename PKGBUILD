# Maintainer: asas1asas200 <asas1asas200@gmail.com>
pkgname="chatgpt-desktop-bin"
pkgver="1.1.0"
pkgrel=1
pkgdesc="ChatGPT Desktop Application (Mac, Windows and Linux)"
arch=("x86_64")
url="https://github.com/lencx/ChatGPT"
makedepends=("binutils"
             "tar")
depends=("openssl"
         "webkit2gtk"
         "libayatana-appindicator"
		 "hicolor-icon-theme"
		 "cairo"
		 "gtk3"
		 "glib2"
		 "libsoup"
		 "glibc"
		 "gdk-pixbuf2"
		 "gcc-libs"
		 )
provides=("chatgpt-desktop=${pkgver}")
conflicts=('chatgpt-desktop')
license=("Apache")
source=("https://github.com/lencx/ChatGPT/releases/download/v${pkgver}/ChatGPT_${pkgver}_linux_${arch}.deb")
sha256sums=('40290b7290b6fba6b8c58470ffa9bdc20c6077499aa3c058e71d60a69ad15544')
noextract=("chat-gpt_${pkgver}_amd64.deb")

prepare() {
	ar p ChatGPT_${pkgver}_linux_${arch}.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}

