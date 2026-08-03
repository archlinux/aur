# Submitter: mtorromeo
# Maintainer: Bink

pkgname=qpress
pkgver=20260802
pkgrel=1
pkgdesc='Portable high-speed file archiver using QuickLZ'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/PierreLvx/qpress'
# Upstream: GPL 1, 2 and 3 (LICENSE.GPL-* / readme.md)
license=('GPL-1.0-only' 'GPL-2.0-only' 'GPL-3.0-only')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8c97335e6e5e7cd12d20753f78ca75bbb54699fe34dbac330f98c14114176927')
b2sums=('e1796c9645b5a5ba79f22cc00b59d053512b4f8017e52a8ced0fbed55827a414f359aa7976028e7f84843c8c40ea48aec2f9d97e136ca0b104835cb6ba29984a')

build() {
  cd "${pkgname}-${pkgver}" || exit
  make
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 LICENSE.GPL-1.0 LICENSE.GPL-2.0 LICENSE.GPL-3.0 \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}