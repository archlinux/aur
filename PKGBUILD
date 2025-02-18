#Maintainer:	Giteeajake <giteeajake@qq.com>

pkgname=isd-appimage
pkgver=v0.5.0
pkgrel=2
pkgdesc='A better way to work with systemd units.'
url='https://github.com/isd-project/isd'
arch=('x86_64')
optdepends=("vim")
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver::$url/releases/download/${pkgver}/isd.x86_64-linux.AppImage")
sha512sums=('09c3e62e42ecb86c2ab89ed1e3990681d6deff38e1963bc26ecc367d39e2082db5356e0e76af4558867163487dc35318acf7482ddddaef313dd2364b0a835b1d')
conflicts=("isd")
provides=('isd')
options=(!strip)

check() {
	if [[ ! -f ${srcdir}/${pkgname}-${pkgver} ]]; then
		exit 1
	fi
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/isd"
}
