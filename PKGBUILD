# Maintainer: farwayer <farwayer@gmail.com>

_ver=33.0.1
_android=android-13
pkgname=android-sdk-build-tools-$_ver
pkgver=r$_ver
pkgrel=1
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('x86_64')
url='https://developer.android.com/studio/releases/build-tools'
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')

source=("https://dl-ssl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha256sums=('0fdf2746200ee21d50a837451350e14cb11a544cbb40be5e539a89164cf3b8e5')
options=('!strip')

package() {
  cd "$pkgdir"
  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt
  mkdir -p opt/android-sdk/build-tools/$_ver
  cp -r "$srcdir/$_android/"* "$pkgdir/opt/android-sdk/build-tools/$_ver"
  chmod +Xr -R "$pkgdir/opt/android-sdk/build-tools/$_ver"
}
