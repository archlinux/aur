# Maintainer: MaoYaoTang <maoyaotang@163.com>
pkgname=android-signapk
pkgver=1.0.0
pkgrel=1
pkgdesc="Arch系统 AOSP signapk 支持 -w --min-sdk-version --disable-v2等签名工具"
arch=('any')
url="https://github.com/maoyaotang12/android-signapk"
license=('MIT')
depends=('java-runtime')

source=(
  git+${url}.git)

sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "$pkgdir/usr/share/java/signapk"
  install -m644 *.jar "$pkgdir/usr/share/java/signapk/"

  install -Dm755 apksigner.sh "$pkgdir/usr/bin/signapk"
}
