# Contributor: Sebastian Wolf <swolf at melonkru dot de>
pkgname=advancemame
pkgver=1.4
pkgrel=1
pkgdesc="Unofficial MAME version with an advanced video support for helping the use with TVs, Arcade Monitors, Fixed Frequencies Monitors and also for PC Monitors"
arch=('i686' 'x86_64')
url="http://www.advancemame.it"
depends=('sdl' 'alsa-lib' 'expat' 'freetype2' 'slang')
license=('GPL')
source=("https://github.com/amadvance/advancemame/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c11198e2e5eaa834a2bf00739e57b7fd')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make bindir="${pkgdir}/usr/bin/" \
       datadir="${pkgdir}/usr/share/" \
       mandir="${pkgdir}/usr/share/man/" \
       pkgdocdir="${pkgdir}/usr/share/doc/${pkgname}/" \
       install
}

