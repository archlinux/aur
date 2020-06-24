# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Faye Jackson <justalittleepsilon@gmail.com>
pkgname=msync
pkgver=0.9.9.2
pkgrel=1
_tagver="v$pkgver"
pkgdesc="A low bandwidth store and forward Mastodon / Pleroma API command line client"
arch=(x86_64)
url=http://github.com/Kansattica/msync
license=('GPL')
depends=(curl libcurl3-gnutls)
provides=(msync)
conflicts=(msync-git)
source=("https://github.com/Kansattica/msync/releases/download/${_tagver}/msync-${_tagver}-install-linux-x64-gcc")
md5sums=('36805caf7677919bf4428656e74dc74a')

package() {
	cd $srcdir
	curl "https://raw.githubusercontent.com/Kansattica/msync/master/LICENSE" > LICENSE
	install -D -m755 "msync-${_tagver}-install-linux-x64-gcc" "${pkgdir}/usr/bin/msync"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/msync/LICENSE"
}
