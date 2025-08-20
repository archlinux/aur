# Maintainer: farwayer <farwayer@gmail.com>

_ver=36
_android=android-16
pkgname=android-sdk-build-tools-$_ver
pkgver=r$_ver
pkgrel=1
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('x86_64')
url='https://developer.android.com/studio/releases/build-tools'
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')

source=("https://dl.google.com/android/repository/build-tools_${pkgver}_linux.zip")
sha256sums=('5d9ac77fb6ff43d9da518a337b4fcf8f9097113df531d99ccefe80ef7ce8250b')
options=('!strip')

package() {
  cd "$pkgdir"
  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt
  mkdir -p opt/android-sdk/build-tools/$_ver
  cp -r "$srcdir/$_android/"* "$pkgdir/opt/android-sdk/build-tools/$_ver"
  chmod +Xr -R "$pkgdir/opt/android-sdk/build-tools/$_ver"
}
