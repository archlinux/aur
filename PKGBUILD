# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE (prebuilt binary)"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio')
provides=('minnow')
conflicts=('minnow')
# Pulls the tarball the "Release packages" GitHub Actions workflow attaches to each
# tagged release (built in an archlinux:latest container, so it's ABI-compatible here).
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/releases/download/v$pkgver/minnow-v$pkgver-x86_64.tar.gz")
sha256sums=('aecd0cef5116fcd31a8fd5d05dfb2f4dee7a89286af190cf15bd18562003941e')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
