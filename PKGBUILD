# Maintainer: mapleafgo <mapleafgo@163.com>
pkgname=hugo-extended-cli
pkgver=0.115.2
pkgrel=1
pkgdesc="Extended version of Hugo"
arch=('x86_64' 'aarch64')
url="https://gohugo.io/"
license=('Apache 2.0')
conflicts=('hugo'
		'hugo-git'
		'hugo-extended-bin')
source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_Linux-amd64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_linux-arm64.tar.gz)
md5sums_x86_64=("SKIP")
md5sums_aarch64=("SKIP")

pkgver() {
	curl https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | awk -F '\"' '{print $4}' | awk -F 'v' '{print $2}'
}

build() {
	tar -xzf $pkgname-$pkgver-$CARCH.tar.gz
}

package() {
	install -Dm755 "hugo" "${pkgdir}"/usr/bin/hugo
}
