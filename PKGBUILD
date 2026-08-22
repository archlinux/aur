# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc-bin
pkgver=0.2.7
pkgrel=2
pkgdesc="A cli tool to change source for every software on every platform"
arch=('x86_64') # TODO: add more archs
url="https://github.com/RubyMetric/chsrc"
license=('GPL-3.0-or-later' 'MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('bash-completion: Bash auto-completion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$url/releases/download/v$pkgver/chsrc-x64-linux"
	"https://raw.githubusercontent.com/RubyMetric/chsrc/v$pkgver/LICENSE-MIT.txt"
	"https://github.com/RubyMetric/chsrc/raw/v$pkgver/doc/chsrc.1"
	"https://github.com/RubyMetric/chsrc/raw/v$pkgver/doc/chsrc.texi"
	"https://github.com/RubyMetric/chsrc/raw/v$pkgver/tool/completion/bash_completion.sh"
)
noextract=()
sha256sums=('70d236dbd346e969a3d2abe507343eb07419be494ff40fd117cad44c619465d5'
            '64fbbf5be547a2de5ff9f49591e0a57e6e1e15b989a5da8e786bc40b5dca0907'
            'adde87c3f202a9d9faffe046f7d4ab656817f16f2f1e70db2687030da6c1cad9'
            '8a536fcb336738637ef27a9bb28357b5a8871462ef395f52c195947d3b9bcd1f'
            'afa68667fe40633a07f9c697173201eb7f10769780c15749bfb006b75b82cf89')
validpgpkeys=()

package() {
	install -Dm 755 chsrc-x64-linux $pkgdir/usr/bin/chsrc
	# MIT License
	install -Dm 644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/$pkgname
	# Man Page
	install -Dm 644 chsrc.1 -t $pkgdir/usr/share/man/man1/
	# Bash Completion
	install -Dm 644 bash_completion.sh $pkgdir/usr/share/bash-completion/completions/chsrc
	# Texinfo
	makeinfo chsrc.texi --output=chsrc.info
	install -Dm 644 chsrc.info -t $pkgdir/usr/share/info/
}
