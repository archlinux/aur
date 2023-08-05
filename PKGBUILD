# Maintainer: Kimiblock Moe <pn3535 at icloud dot com>
pkgname=rime-minecraft-dict-git
pkgver=r4.b294e27
pkgrel=1
pkgdesc="Minecraft dict for Rime (WIP)"
arch=('any')
url="https://github.com/Kimiblock/rime-minecraft-dict"
license=('GPL3')
depends=()
provides=('rime-minecraft-dict')
source=("git+https://github.com/Kimiblock/rime-minecraft-dict.git")
sha256sums=("SKIP")
install=${pkgname}.install

function pkgver(){
	cd rime-minecraft-dict
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function package(){
	install -Dm644 "${srcdir}/rime-minecraft-dict/minecraft_pinyin.dict.yaml" "${pkgdir}/usr/share/rime-data/minecraft_pinyin.dict.yaml"
}

function _info() {
	if [ -f /usr/bin/pamac ]; then
		echo "  ==> [Info]: $@"
	else
		all_off="$(tput sgr0)"
		bold="${all_off}$(tput bold)"
		blue="${bold}$(tput setaf 4)"
		yellow="${bold}$(tput setaf 3)"
		printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
    fi
}
