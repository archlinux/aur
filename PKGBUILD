# Maintainer: mapleafgo <mapleafgo@163.com>
pkgname=hugo-extended-cli
pkgver=0.115.2
pkgrel=1
pkgdesc="Extended version of Hugo"
arch=('x86_64')
url="https://gohugo.io/"
license=('Apache 2.0')
conflicts=('hugo'
		'hugo-git'
		'hugo-extended-bin')
source=("https://github.com/gohugoio/hugo/releases/download/v$pkgver/hugo_${pkgver}_checksums.txt")
md5sums=("SKIP")

pkgver() {
	curl https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | awk -F '\"' '{print $4}' | awk -F 'v' '{print $2}'
}

build() {
	curl -L https://github.com/gohugoio/hugo/releases/download/v$pkgver/hugo_extended_${pkgver}_Linux-64bit.tar.gz -o dl.tar.gz
	tar -xzf dl.tar.gz
}

package() {
	install -Dm755 "hugo" "${pkgdir}"/usr/bin/hugo
}
