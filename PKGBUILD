# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver='1.5.7'
pkgrel=3
pkgdesc="Cast media from Jellyfin Mobile and Web apps to MPV. (Unofficial)"
arch=('any')
url='https://github.com/iwalton3/jellyfin-mpv-shim'
license=('MIT')
depends=('mpv' 'python>=3.6' 'python-mpv' 'python-mpv-jsonipc>=1.1.9' 'python-jellyfin-apiclient>=1.4.0' 'tk')
makedepends=('python-setuptools')
optdepends=('python-pystray: systray support'
	'python-jinja: display mirroring support'
	'python-pywebview: desktop client and display mirroring support'
	'python-werkzeug: desktop client support'
	'python-flask: desktop client support')
source=("https://github.com/iwalton3/jellyfin-mpv-shim/archive/v1.5.7.tar.gz")
sha256sums=('0006c228473fb3df8fc849a7c22908dcd9afe77e1ffc1207098c1a068150bc38')

build() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
