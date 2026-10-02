# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ydf
pkgver=0.3.1
pkgrel=1
pkgdesc="A disruptive dotfiles manager+: be ready to work in just a few minutes on your fresh OS"
arch=('any')
url="https://github.com/yunielrc/ydf"
license=('GPL-3.0-only')
depends=('bash')
backup=('etc/ydf/ydf.env')
optdepends=('git: version the ~/.ydf-packages directory' 'docker: optional package type' 'docker-compose: optional package type')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11c9b6041b82c12acbeb87a5896e35cfbfc5b4d12be7e41cd41a01c03cf636d0')

package() {
	cd "ydf-$pkgver"
	DESTDIR="$pkgdir" make install
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
