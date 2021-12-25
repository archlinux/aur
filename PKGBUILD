# Maintainer: obslsessed obslsessed@protonmail.com
pkgname="cate-gms2-bin"
pkgver="1.4"
pkgrel="1"
pkgdesc="funny jinx the cat game where you click the cat, a gamemaker studio 2 remake by Skirlez of the scratch game \"cate remix remix remix remix remix remix\" about the big-footed cat named jinx"
arch=("x86_64")
url="https://github.com/Skirlez/cate-gms2"
license=("custom")
depends=("wine")
source_x86_64=("https://github.com/Skirlez/cate-gms2/releases/download/$pkgver/cate-gms2.zip" "https://raw.githubusercontent.com/Skirlez/cate-gms2/main/cate-gms2/options/windows/icons/icon.ico")
sha256sums_x86_64=("1100f6c41108f689f94fd9688e898ef8c3ba9edd10cc4fc24a8c451f752c2b86" "337f3d6572960f32ef1ff492a9530dceac573be989395f9002f0e635af5bd25d")
package() {
  
  echo "[Desktop Entry]
Encoding=UTF-8
Version=1.4
Type=Application
Terminal=false
Exec=wine /opt/cate-gms2/cate-gms2.exe
Name=cate-gms2
Categories=Game;
Icon=/opt/cate-gms2/icon.ico" > "$srcdir/cate-gms2.desktop"
  install -Dt "$pkgdir/usr/share/applications/" -m4755 "$srcdir/cate-gms2.desktop"
  install -Dt "$pkgdir/opt/cate-gms2/" -m4755 "$srcdir/icon.ico"
  mkdir -p  "$pkgdir/opt/cate-gms2/" 
  cp -r "$srcdir/cate-gms2/" "$pkgdir/opt/"
}
