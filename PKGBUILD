# Maintainer: Ruben Kharel <kharelruben@gmail.com>

# https://github.com/slithery0/chatgpt-cli/archive/refs/tags/v0.0.1.tar.gz
pkgname=chatgpt-cli-git
pkgver=r27.98e9e52
pkgrel=1
pkgdesc='A minimal, bloat free chatgpt cli'

arch=('i686' 'x86_64')
url="https://github.com/slithery0/chatgpt-cli"
depends=("python3" "python-pip")

provides=("chatgpt-cli")
conflicts=("chatgpt-cli")

license=('MIT')
md5sums=('SKIP')

source=("git+https://github.com/slithery0/${pkgname%-git}")

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	pip3 install -r requirements.txt
}

package() {
    cd "${pkgname%-git}"
		install -Dm755 chatgpt-cli.py "${pkgdir}/usr/bin/chatgpt-cli"
}
