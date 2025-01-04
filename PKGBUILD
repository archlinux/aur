# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=Nero-umu
pkgname=nero-umu
pkgver=0.94
pkgrel=1
pkgdesc='A fast and efficient umu manager, just as the Romans designed.'
arch=('x86_64')
url='https://github.com/SeongGino/Nero-umu'
license=('GPL-3.0-only')
depends=('qt6-base' 'icu' 'quazip-qt6' 'umu-launcher')
makedepends=('cmake')
optdepends=(
            'curl: For downloading external files to install into prefixes'
            'icoextract: Extract Windows ico files'
            'icoutils: Convert contents of ico files'
            'winetricks: Fallback for Proton runners without embedded protonfixes'
)
source=("https://github.com/SeongGino/Nero-umu/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('6a422a56575dbb588030ca68de8485e9')

build() {
  mkdir "$srcdir/$_name-$pkgver/build"
  cd "$srcdir/$_name-$pkgver/build"
  cmake .. -DNERO_VERSION=$pkgver
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver/build/nero-umu" "$pkgdir/usr/bin/nero-umu"
  install -Dm755 "$srcdir/$_name-$pkgver/img/ico/ico_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name-$pkgver/img/ico/ico_48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name-$pkgver/img/ico/ico_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name-$pkgver/img/ico/ico_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/xyz.TOS.Nero.png"
  install -Dm755 "$srcdir/$_name-$pkgver/xyz.TOS.Nero.desktop" "$pkgdir/usr/share/applications/xyz.TOS.Nero.desktop"
}
