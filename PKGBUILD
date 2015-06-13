# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Gu, Cong <gucong43216@gmail.com>
# Modified (source changed) by codetrick <codetrick@gmail.com>
pkgname=stardict-wordnet
pkgver=2.4.2
pkgrel=4
pkgdesc="WordNet dictionary for StarDict"
arch=('any')
depends=('stardict')
url="http://stardict.sourceforge.net"
license=('GPL')
#source=(http://yeelou.com/huzheng/stardict-dic/dict.org/stardict-dictd_www.dict.org_wn-$pkgver.tar.bz2)
source=(http://abloz.com/huzheng/stardict-dic/dict.org/stardict-dictd_www.dict.org_wn-$pkgver.tar.bz2)
md5sums=('f164dcb24b1084e1cfa2b1cb63d590e6')

# this is not a perfect mirror, but the best I could find 
#source=(http://downloads.sourceforge.net/xdxf/stardict-comn_dictd04_wn-$pkgver.tar.bz2)
#md5sums=('a7ae5cb6a8dd09344623811291a2a53a')

package()
{
  #cd "$srcdir/stardict-wn-$pkgver/"
  cd "$srcdir/stardict-dictd_www.dict.org_wn-$pkgver"
  mkdir -p "$pkgdir/usr/share/stardict/dic/wordnet"
  mv dictd_www.dict.org_wn.dict.dz wn.dict.dz
  mv dictd_www.dict.org_wn.ifo     wn.ifo
  mv dictd_www.dict.org_wn.idx     wn.idx
  install -m 644 wn.dict.dz wn.ifo wn.idx \
                 "$pkgdir/usr/share/stardict/dic/wordnet"
}
