# Maintainer: Ralph Zhou <1694487365@qq.com>

pkgname=lizzie-improve
_pkgname=lizzie
pkgver=20210803
_pkgver=2.4.1
pkgrel=1
pkgdesc="Analysis interface for KataGo/Leela Zero, more features added by yzy"
arch=('x86_64')
url="https://github.com/featurecat/lizzie"
license=('GPLv3')
depends=('bash' 'java-runtime')
makedepends=('git')
provides=('lizzie')
conflicts=('lizzie')
source=("$_pkgname::git+https://gitee.com/noobspace/lizzieyzy"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm644 "$srcdir"/$_pkgname/lizzie-yzy"$_pkgver"-shaded-linux64.jar "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
  install -Dm644 config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
  install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
  for _file in "$srcdir"/$_pkgname/sound/*.wav
  do
    install -Dm644 "${_file}" "$pkgdir"/usr/share/"$_pkgname"/sound/"$(basename ${_file})"
  done
}
