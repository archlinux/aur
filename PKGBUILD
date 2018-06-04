# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor : Aaron Griffin <aaron@archlinux.org>

pkgname=slim-themes
pkgver=1.2.3
pkgrel=8
pkgdesc="Themes Pack for Simple Login Manager"
arch=('any')
url="https://sourceforge.net/projects/slim.berlios/"
license=('GPL')
depends=('slim')
source=(https://downloads.sourceforge.net/project/slim.berlios/slim-$pkgver-themepack1a.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-lake.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-fingerprint.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-flat.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-lunar-0.4.tar.bz2
        https://downloads.sourceforge.net/project/slim.berlios/slim-previous.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-rainbow.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-rear-window.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-scotland-road.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-subway.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-wave.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-zenwalk.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-archlinux-simple.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-debian-moreblue.tar.bz2)
md5sums=('fd1295d3a260849790dc17081da4a34f'
         'c0cef9e7b95bdf2df3fb303d155f8476'
         '2981627a5822a535f3ebd0e21dba9f76'
         '34696aef39fad7092c80ccf7a38886a5'
         '6fe38013c6eed67dead507616667ae9a'
         '6e846e8adafa70a7bd0e22d5bd06dc5f'
         '631a00eb27c09b0daa50b88bd9606d07'
         '337876e05b2bdf4bd657d114464ad46a'
         'fde18fb892bccc383c93fb7ed07fbe84'
         '8417022e369be012f1b7a4ee04edf0f9'
         'c727aab888dde774acc04403c84b5b3b'
         '7a0bd7a0736794e638668769b9c4c745'
         '7c7aaa255561444a4ae3e9f1dfb4be5d'
         '5f3818e01b0593d0e576fcd7e2c6bafa')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}"/usr/share/slim/themes

  for t in capernoited debian-moreblue fingerprint flat flower2 isolated lake \
           lotus-midnight lotus-sage mindlock parallel-dimensions previous \
           rainbow rear-window scotland-road subway wave; do
    install -dm755 "${pkgdir}"/usr/share/slim/themes/$t
    install -m644 $t/* "${pkgdir}"/usr/share/slim/themes/$t
  done

  install -dm755 "${pkgdir}"/usr/share/slim/themes/archlinux
  install -m644 slim-archlinux-simple/* "${pkgdir}"/usr/share/slim/themes/archlinux

  install -dm755 "${pkgdir}"/usr/share/slim/themes/lunar
  install -m644 slim-lunar-0.4/* "${pkgdir}"/usr/share/slim/themes/lunar

  install -dm755 "${pkgdir}"/usr/share/slim/themes/zenwalk
  install -m644 Zenwalk/* "${pkgdir}"/usr/share/slim/themes/zenwalk
}
