# Maintainer: jackreeds
maintainer=jackreeds
pkgname_orig=gobuster
pkgname=gobuster-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="A Directory/File, DNS and VHost busting tool"
arch=('x86_64')
url="https://github.com/OJ/gobuster"
provides=('gobuster')
license=('Apache')
depends=('p7zip')
conflicts=('gobuster' 'gobuster-git')
binname=${pkgname_orig}-${pkgver}-${pkgrel}
dirname=${pkgname_orig}-linux-amd64
source_x86_64=(
	"${binname}.7z::${url}/releases/download/v${pkgver}/${dirname}.7z"
)
sha256sums_x86_64=(
	'7f11cba97772ac4f276177d5d782e6ebda58fbdbbbf959d6cb02e0454bc52e14'
)

package(){
	7z x "${binname}.7z"
	install -Dm755 "${dirname}/${pkgname_orig}" "$pkgdir/usr/bin/${pkgname_orig}"
}
