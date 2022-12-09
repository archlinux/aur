# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: asas1asas200 <asas1asas200@gmail.com>
pkgname="chatgpt-desktop-bin"
pkgver="0.2.0"
pkgrel=1
pkgdesc="Unofficial open source OpenAI ChatGPT desktop app."
arch=("x86_64")
url="https://github.com/sonnylazuardi/${pkgname/-bin/}"
makedepends=("binutils"
			 "tar")
depends=("webkit2gtk")
conflicts=('chatgpt-desktop')
source=("https://github.com/sonnylazuardi/chatgpt-desktop/raw/master/releases/chatgpt_${pkgver}_amd64.deb")
sha256sums=('93e569017bf4171c1fee93e5129c2ad1ed7ff8be17666a9efed1c573926e782f')
noextract=("chatgpt_${pkgver}_amd64.deb")

prepare() {
	ar p chatgpt_${pkgver}_amd64.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}

