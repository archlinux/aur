# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
# Based on android-sdk-build-tools by xgdgsc and mynacol

pkgname=android-sdk-build-tools-30.0.2
#_ver=$(cat "${srcdir}/$_android/source.properties" |grep ^Pkg.Revision=|sed 's/Pkg.Revision=\([0-9.]*\).*/\1/')
_ver=30.0.2
pkgver=r$_ver
pkgrel=2
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('i686' 'x86_64')
url="https://developer.android.com/studio/releases/build-tools"
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')

source=("https://dl-ssl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha512sums=('38661dbdc2611c18cca49c27a708c592129c87dbc603ea2df3aff3918ba41f022762a1476f4de0142943933fa3298492d7afae7623c7e6ed778d03a23697c9e0')
options=('!strip')

_sdk=android-sdk
_android=android-11

package() {
  cd "$pkgdir"

  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt

  target="opt/$_sdk/build-tools/$_ver"
  mkdir -p "$target"
  cp -r "$srcdir/$_android/"* "$target"
  chmod +Xr -R "$target"
}
