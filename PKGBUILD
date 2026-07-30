# Maintainer: farwayer <farwayer@gmail.com>

_ver=34
_fullver=34.0.0
_android=android-14
pkgname=android-sdk-build-tools-$_ver
pkgver=r$_ver
pkgrel=2
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('x86_64')
url='https://developer.android.com/studio/releases/build-tools'
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')
source=("https://dl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha256sums=('e858c4b60069d0431051b225d384413b1643e1289b00a4825aed347f25bd510f')
options=('!strip')

package() {
  cd "$pkgdir"
  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt
  mkdir -p opt/android-sdk/build-tools/$_fullver
  cp -r "$srcdir/$_android/"* "$pkgdir/opt/android-sdk/build-tools/$_fullver"
  chmod +Xr -R "$pkgdir/opt/android-sdk/build-tools/$_fullver"
}
