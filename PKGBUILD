# Maintainer: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=fortune-mod-cs
pkgver=2.0.9
pkgrel=1
pkgdesc="Collection of Czech and Slovak fortune cookie files."
arch=('any')
url="http://ftp.phil.muni.cz/pub/local/fortune"
license=('GPL')
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://ftp.phil.muni.cz/pub/local/fortune/fortune-cs-$pkgver.tar.bz2)
md5sums=('0de253dc2670c7bf5670c7c820f5a90d')

package() {
  cd "${srcdir}/fortune-cs-$pkgver/src/cookies"
  install -d "${pkgdir}/usr/share/fortune/cs"
  install -m 644 * "${pkgdir}/usr/share/fortune/cs/"

  cd "${pkgdir}/usr/share/fortune/cs"
  for _file in *; do
      strfile -s $_file
      #ln -s $_file $_file.u8
  done
}
