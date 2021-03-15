# Maintainer: Ben <bensongsyz@gmail.com>
pkgname='wudao-dict-git'
pkgver=2.1
pkgrel=2
pkgdesc='The command line version of Youdao Dictionary, supporting English-Chinese mutual search and online search.'
arch=('any')
url="https://github.com/ChestnutHeng/Wudao-dict"
license=('unknown')
depends=('python' 'python-bs4' 'python-lxml')
install="wudao-dict-git.install"
makedepends=('git')
source=('wudao-dict::git://github.com/ChestnutHeng/Wudao-dict.git'
		'wd')
md5sums=('SKIP'
		'7e504991b277c83136466f885626cd7c')

package() {
	mkdir -p "${pkgdir}/opt"
	cp -r "./wudao-dict/wudao-dict" "${pkgdir}/opt/"

#	# 添加系统命令wd
	mkdir -p "${pkgdir}/usr/bin"
	cp ./wd "${pkgdir}/usr/bin"

	# 添加bash_completion自动补全
	mkdir -p "${pkgdir}/etc/bash_completion.d"
	ln -s /opt/wudao-dict/wd_com "${pkgdir}/etc/bash_completion.d/wd"
}
