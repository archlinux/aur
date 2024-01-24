# Maintainer: Kimiblock Moe
pkgname=rime-minecraft-dict-git
pkgver=r24.13107bd
pkgrel=1
pkgdesc="Minecraft dict for RIME"
arch=('any')
url="https://github.com/Kimiblock/rime-minecraft-dict"
license=('GPL-3.0-or-later')
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
	install -Dm644 "${srcdir}/rime-minecraft-dict/minecraft_en.dict.yaml" "${pkgdir}/usr/share/rime-data/minecraft_pinyin.dict.yaml"
	install -Dm644 "${srcdir}/rime-minecraft-dict/minecraft_cn.dict.yaml" "${pkgdir}/usr/share/rime-data/minecraft_pinyin.dict.yaml"
}

