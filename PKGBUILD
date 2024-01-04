# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: gaelic < gaelic at luchmhor dot net>
# Contributor: Peter Reschenhofer < peterreschenhofer at gmail dot com >

pkgname=gams
pkgver=45.5.0
pkgrel=1
pkgdesc='A high-level modeling system for mathematical optimization'
arch=('x86_64')
license=('custom')
url='https://gams.com/'
depends=('glibc')
options=('!strip')
source=("$pkgname-$pkgver.exe::https://d37drm4t2jghv5.cloudfront.net/distributions/$pkgver/linux/linux_x64_64_sfx.exe"
        "gams-studio.desktop")
sha256sums=('dfa45855dc9db4d1d832f590c156b4cb8fc549b890c95687917ffd50ddbad76b'
            '5349929ad07ea8de5e6f1e5d03f264b2fd5afc161b4204981d30fc2ff8faed7e')

package() {
	install -d "$pkgdir/opt/gams" "$pkgdir/usr/bin"
	cp -a --no-preserve=ownership "gams${pkgver::4}_linux_x64_64_sfx/"* "$pkgdir/opt/gams/"
	install -Dvm644 gams-studio.desktop -t "$pkgdir/usr/share/applications/"
	ln -sv "/opt/gams/gams" "$pkgdir/usr/bin/gams"
	ln -sv "/opt/gams/studio/studio.AppImage" "$pkgdir/usr/bin/gams-studio"
}
