# Contributor: Igor Belov <ivbelov@gmail.com>
# Maintainer: Dennis Borisevich/denspirit <elfmax@tut.by>

pkgname=stardict-full-eng-rus
pkgver=2.4.2
pkgrel=7
pkgdesc="Large english-russian dictionary for Stardict"
license=('GPL')
optdepends=(
'stardict: for viewing this dictionary'
)
url='http://download.huzheng.org/ru/'
source=("http://download.huzheng.org/ru/$pkgname-$pkgver.tar.bz2")
#source=("http://getfr.no-ip.org/pub/dc/software/stardict-ru/$pkgname-$pkgver.tar.bz2")
#source=("http://sourceforge.net/projects/xdxf/files/dicts-stardict-form-xdxf/002c/stardict-comn_sdict05_eng_rus_full-2.4.2.tar.bz2")
md5sums=('9d6eff29898a47f5c12c5bc9836a03eb')
makedepends=('stardict-tools-git' 'dictd')
arch=(any)
prepare() {
    msg "Repairing dictionary using stardict-repair from stardict-tools-git..."
    cd $srcdir/
    mkdir -p repaired
    stardict-repair --compress-dict -q $pkgname-$pkgver/*.ifo -O repaired
}
package() {
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 repaired/* $pkgdir/usr/share/stardict/dic/
  }

#md5sums=('a2d2bf21297135b6417a3bf88a3e751d')
