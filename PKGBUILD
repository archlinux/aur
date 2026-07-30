# Maintainer: farwayer <farwayer@gmail.com>

_ver=35
_fullver=35.0.0
_android=android-15
pkgname=android-sdk-build-tools-$_ver
pkgver=r$_ver
pkgrel=2
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('x86_64')
url='https://developer.android.com/studio/releases/build-tools'
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')
source=("https://dl.google.com/android/repository/build-tools_${pkgver}_linux.zip")
sha256sums=('bd3a4966912eb8b30ed0d00b0cda6b6543b949d5ffe00bea54c04c81e1561d88')
options=('!strip')

package() {
  cd "$pkgdir"
  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt
  mkdir -p opt/android-sdk/build-tools/$_fullver
  cp -r "$srcdir/$_android/"* "$pkgdir/opt/android-sdk/build-tools/$_fullver"
  chmod +Xr -R "$pkgdir/opt/android-sdk/build-tools/$_fullver"
}
