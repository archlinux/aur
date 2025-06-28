# Contributor: Feresey <p.milko1999@yandex.ru>

pkgname=exo-player
pkgver=0.9.0
pkgrel=1
pkgdesc="Qt frontend to MOC (Music on Console) player"
arch=(x86_64)
url=https://github.com/loimu/exo
license=('GPL-3.0-or-later')
makedepends=(cmake git qt5-tools)
depends=(bash liblastfm-qt5 hicolor-icon-theme python gcc-libs qt5-base)
optdepends=("python-notify2: for moc-osd")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('d48bd7e59a1e7a7e5bd280cb9bae9f814c7ea9b38ce9ec61f0421ebe5475242f')

build() {
    cmake -B build -S exo \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5	
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

