# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com> 
# Contributor: Arkham <arkham at archlinux dot us> 
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=gtk-theme-shiki-colors-revival
_pkgname=shiki-colors-revival
pkgver=2.0.1
pkgrel=1
pkgdesc='Shiki Colors GTK theme, based off Numix'
arch=('i686' 'x86_64')
url='https://github.com/Somasis/shiki-colors-revival'
license=('GPL' 'GPL3' 'ISC')
depends=('gtk-engines')
optdepends=('gtk-engine-murrine: for GTK2 themes'
            'metacity: for Metacity themes'
            'marco: for Metacity themes'
            'mutter: for Metacity themes'
            'plank: for Plank themes'
            'xfwm4: for Xfwm4 themes')
source=("shiki-colors-revival-$pkgver.tar.gz::https://github.com/Somasis/shiki-colors-revival/archive/v$pkgver.tar.gz")
sha256sums=('89a499e78c89fc67b293cbaba65437fd715d8005ca94944932d482d3799064ef')

build() {
  cd $_pkgname-$pkgver
  no_git=true
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install 
}
