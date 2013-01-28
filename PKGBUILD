# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Original maintainer: Lakota Morris <lakota.james@gmail.com>
pkgname=mcskinedit
pkgver=alpha3pre7
pkgrel=2
pkgdesc="Minecraft Skin Editor"
arch=(any)
license=(unknown)
changelog=ChangeLog
url='http://www.minecraftforum.net/topic/3796-skinedit-new-version-13-april-alpha-3-pre-7/#entry49969'
depends=('java-runtime')
source=('http://orcsinthebasement.com/tempDL/SkinEdit+Alpha+3+pre+7.zip'
        'mcskinedit'
        'https://dl.dropbox.com/u/15956363/skintest2.jar')
md5sums=('d55191ab04cef76faf7d3a5c4bee288d'
         'feacb66ff8b71fbf00d13bcb0f829f43'
         'ec418807008ad3f14d55db6457a693b8')

package() {
  cd "$srcdir" || return 1

  install -d $pkgdir/usr/bin
  install -m755 -t $pkgdir/usr/bin mcskinedit
  install -d $pkgdir/usr/share/$pkgname
  install -m644 -t $pkgdir/usr/share/$pkgname MCSkinEdit.jar skintest2.jar
  install -d $pkgdir/usr/share/$pkgname/parts
  install -m644 -t $pkgdir/usr/share/$pkgname/parts parts/*
  install -d $pkgdir/usr/share/$pkgname/backgrounds
  install -m644 -t $pkgdir/usr/share/$pkgname/backgrounds backgrounds/*
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 -t $pkgdir/usr/share/doc/$pkgname readme.txt
}

# vim:set ts=4 sw=4 et:
