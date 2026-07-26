# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE (prebuilt binary)"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications')
provides=('minnow')
conflicts=('minnow')
# Pulls the tarball the "Release packages" GitHub Actions workflow attaches to each
# tagged release (built in an archlinux:latest container, so it's ABI-compatible here).
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/releases/download/v$pkgver/minnow-v$pkgver-x86_64.tar.gz")
sha256sums=('d4adf28708e8bec0b2e1ef359c360205c2f61d639c71c25ab4f7cecb8ba975e5')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
