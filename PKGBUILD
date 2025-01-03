# Maintainer: Kimiblock Moe

pkgname=rime-project-trans-git
pkgver=r3.67b410f
source=("git+https://github.com/project-trans/rime-dict.git")
license=(unknown)
arch=('any')
makedepends=()
pkgrel=1
url="https://github.com/project-trans/rime-dict"
pkgdesc="跨儿计划 RIME 词典"
md5sums=("SKIP")
provides=("rime-project-trans")
conflicts=(rime-project-trans-bin)

function pkgver() {
	cd "${srcdir}/rime-dict"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function package() {
	install -Dm644 "${srcdir}/rime-dict/project_trans.dict.yaml" \
		"${pkgdir}/usr/share/rime-data/project_trans.dict.yaml"
	install -Dm644 "${srcdir}/rime-dict/project_trans_pinyin.dict.yaml" \
		"${pkgdir}/usr/share/rime-data/project_trans_pinyin.dict.yaml"
}
