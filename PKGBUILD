# Maintainer: obslsessed <obslsessed@protonmail.com>
pkgname="cate-bossfight-bin"
pkgver="1.5.1"
pkgrel="1"
pkgdesc="funny jinx the cat game where you click the cat, a gamemaker remake by Skirlez of the scratch game \"cate remix remix remix remix remix remix\" about the big-footed cat named jinx"
arch=("x86_64")
url="https://github.com/Skirlez/cate-bossfight-gm"
license=("custom")
source_x86_64=("https://github.com/Skirlez/cate-bossfight-gm/releases/download/$pkgver/cate-gms2-linux.zip")
sha256sums_x86_64=("60ebe5c6dfd76aa463aca73a13e331ffffdab8b0362d37afaa03621b538c2644")
package() {
  install -Dt "$pkgdir/usr/share/applications/" -m4755 "$srcdir/../cate-bossfight.desktop"
  install -Dt "$pkgdir/opt/cate-bossfight/assets/" -m4755 "$srcdir/cate-gms2/assets/game.unx" "$srcdir/cate-gms2/assets/icon.png" "$srcdir/cate-gms2/assets/options.ini"
  install -Dt "$pkgdir/opt/cate-bossfight/" -m4755 "$srcdir/cate-gms2/cate_gms2"
  #install directories and executable as cate-bossfight instead of cate-gms2 because the game has been renamed to cate-bossfight but there has not been a new release to reflect that yet
  rename cate_gms2 cate-bossfight "$pkgdir/opt/cate-bossfight/cate_gms2"
}
