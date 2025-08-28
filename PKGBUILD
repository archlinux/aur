# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=miniaudio-git
pkgver=3574.4a5b74b
pkgrel=1
pkgdesc='Single file audio playback and capture library'
arch=('any')
url='https://github.com/mackron/miniaudio'
license=('MIT')
makedepends=('git')
conflicts=('mini_al' 'miniaudio')
provides=('mini_al' 'miniaudio')
source=('git+https://github.com/mackron/miniaudio.git')
sha256sums=('SKIP')

pkgver() {
	cd miniaudio
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd miniaudio
	install -dm755 "${pkgdir}/usr/include/miniaudio/"
	install -m644 miniaudio.h "${pkgdir}/usr/include/miniaudio/miniaudio.h"
	install -dm755 "${pkgdir}/usr/include/miniaudio/extras/"
	install -m644 extras/*.h "${pkgdir}/usr/include/miniaudio/extras/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/miniaudio-git/LICENSE"
}
