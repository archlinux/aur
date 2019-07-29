pkgname="youtube-cli"
pkgver=1.2
pkgrel=1
pkgdesc="A cli client to play audio from youtube with caching"
arch=("x86_64")
url="https://github.com/uditkarode/youtube-cli"
license=('MIT')
depends=('youtube-dl' 'mpv' 'git' 'python')
source=(${pkgname}::git+https://github.com/uditkarode/youtube-cli.git)
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
	install -Dm755 "${pkgname}/youtube-cli" "${pkgdir}/usr/bin/youtube-cli"
	install -Dm755 "${pkgname}/ytcli" "${pkgdir}/usr/bin/ytcli"
	chmod a+x "${pkgdir}/usr/bin/youtube-cli" "${pkgdir}/usr/bin/ytcli"
}

