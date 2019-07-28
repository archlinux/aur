pkgname="youtube-cli"
pkgver=1.0
pkgrel=1
pkgdesc="A cli client to play audio"
arch=("x86_64")
url="https://github.com/vivekkairi/youtube-cli"
license=('sha265')
depends=('youtube-dl' 'mpv' 'git' 'python')
source=(${pkgname}::git+https://github.com/vivekkairi/youtube-cli.git)
md5sums=('SKIP')

build() {
	cd "$pkgname"
	if [ -d "/home/${USER}/.songs/" ]; then
		echo "DIR already exists"
	else
		mkdir ~/.songs	
	fi
}

package() {
	install -Dm777 "${pkgname}/ytm" "${pkgdir}/usr/bin/youtube-cli"
	install -Dm777 "${pkgname}/ytcli" "${pkgdir}/usr/bin/ytcli"
	chmod a+x "${pkgdir}/usr/bin/youtube-cli" "${pkgdir}/usr/bin/ytcli"
}

