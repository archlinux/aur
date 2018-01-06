# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastien Piccand <sebcactus@gmail.com>

pkgname=dguitar
pkgver=0.5.8
pkgrel=6
pkgdesc="A guitar pro tab reader"
arch=('any')
url="http://dguitar.sourceforge.net/"
license=("GPL")
depends=('java-runtime' 'sh')
makedepends=('unzip')
source=(http://download.sf.net/$pkgname/DGuitar-$pkgver.zip
	dguitar.sh
	dguitar.desktop)
md5sums=('3d10723d96203705b4044b48a755990f'
         'fd6800cb0baddac00c9c058c42e6cd6a'
         '4f5a55d4dd27871b5d9e78865c26d81a')

package() {
  cd "$srcdir"/DGuitar-$pkgver
  install -D -m644 dist/DGuitar.jar "$pkgdir"/usr/share/java/dguitar/DGuitar.jar
  install -D -m644 dist/Common.jar "$pkgdir"/usr/share/java/dguitar/Common.jar
  install -D -m755 "$srcdir"/dguitar.sh "$pkgdir"/usr/bin/dguitar
  install -D -m644 "$srcdir"/dguitar.desktop "$pkgdir"/usr/share/applications/dguitar.desktop
  install -D -m644 skins/dguitar_32x32.png "$pkgdir"/usr/share/pixmaps/dguitar.png
  mkdir -p "$pkgdir"/usr/share/dguitar
  cp -r skins lang files "$pkgdir"/usr/share/dguitar
  chmod -R 644 "$pkgdir"/usr/share/dguitar/*
  chmod 755 "$pkgdir"/usr/share/dguitar/{lang,files,skins,skins/{default,compact}}
}
