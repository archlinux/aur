# Maintainer: Kimiblock Moe
pkgname=rime-minecraft-dict-git
pkgver=1.20.4.r9.gbaaf0e9a
pkgrel=1
pkgdesc="Minecraft dict for RIME"
arch=('any')
url="https://github.com/Kimiblock/rime-minecraft-dict"
license=('GPL-3.0-or-later')
depends=()
provides=('rime-minecraft-dict')
conflicts=('rime-minecraft-dict')
source=("git+https://github.com/Kimiblock/rime-minecraft-dict.git")
sha256sums=("SKIP")

function pkgver(){
	cd rime-minecraft-dict
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function package(){
	install -Dm644 "${srcdir}/rime-minecraft-dict/minecraft_en.dict.yaml" \
		"${pkgdir}/usr/share/rime-data/minecraft_pinyin.dict.yaml"
	install -Dm644 "${srcdir}/rime-minecraft-dict/minecraft_cn_ext.dict.yaml" \
		"${pkgdir}/usr/share/rime-data/minecraft_pinyin.dict.yaml"
	install -Dm644 "${srcdir}/rime-minecraft-dict/minecraft_cn.dict.yaml" \
		"${pkgdir}/usr/share/rime-data/minecraft_pinyin.dict.yaml"
}

