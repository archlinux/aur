# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc-bin
pkgver=0.2.5
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
sha256sums=('60d170f779adec36e31d33ebc931db92fa246b7730fbabeb5b6373530febf2cd'
            '64fbbf5be547a2de5ff9f49591e0a57e6e1e15b989a5da8e786bc40b5dca0907'
            '6fd6284b93b2dd4bccbc09cfb299babfbf5d67e99277104258ae27848458b5da'
            '0c8fdceb05d1fe6cfcbc0ee47c1e1be38a68e52db7c43867c91f9210eb534221'
            'a64e65440463f04d5f1e80fa84b1131675dc83529f7dc74a9df8c5d98354eaa1')
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
