# Maintainer: farwayer <farwayer@gmail.com>

_ver=33.0.2
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
sha256sums=('ff19ccbe3a5098b5dd10722063ebcd40218a30d23b50133e386fc39ea5240e79')
options=('!strip')

package() {
  cd "$pkgdir"
  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt
  mkdir -p opt/android-sdk/build-tools/$_ver
  cp -r "$srcdir/$_android/"* "$pkgdir/opt/android-sdk/build-tools/$_ver"
  chmod +Xr -R "$pkgdir/opt/android-sdk/build-tools/$_ver"
}
