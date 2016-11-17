# Maintainer: Martin Minka <martin dot minka at gmail dot com>
# Author: Henk Westhuis <henk underscore westhuis at hotmail dot com>
pkgname=gitextensions
epoch=1
pkgver=2.48.05
pkgrel=1
pkgdesc="Graphical user interface for Git that allows you control Git without using the commandline."
arch=('any')
url="http://code.google.com/p/gitextensions/"
license=('GPL3')
depends=('mono' 'git')
optdepends=('meld: compare and merge',
'kdiff3: compare and merge'
)
source=('gitextensions' 'gitextensions.desktop' 'gitextensions.png' "http://downloads.sourceforge.net/project/gitextensions/Git%20Extensions/Version%20$_pkgver/GitExtensions-$_pkgver-Mono.zip")
md5sums=('b01b1bf6d75b30f6763daa0498385e99'
         'cd36dafb8e961f67701117f622240e9b'
         'bbd6381241e896200c8494981115dff6'
         '4934111a08b2c482d51c5b6b25d0d227')
package() {
  install -d $pkgdir/usr/share/GitExtensions/
  cp -r $srcdir/GitExtensions/* $pkgdir/usr/share/GitExtensions/

#  # fix https://github.com/gitextensions/gitextensions/issues/1960#issuecomment-22488217
#  mkdir $pkgdir/usr/share/GitExtensions/Plugins/broken
#  mv $pkgdir/usr/share/GitExtensions/Plugins/BackgroundFetch.dll $pkgdir/usr/share/GitExtensions/Plugins/AutoCompileSubmodules.dll $pkgdir/usr/share/GitExtensions/Plugins/broken/

  install -D -m755 $srcdir/gitextensions $pkgdir/usr/bin/gitextensions
  install -D -m644 $srcdir/gitextensions.png $pkgdir/usr/share/pixmaps/gitextensions.png
  install -D -m644 $srcdir/gitextensions.desktop $pkgdir/usr/share/applications/gitextensions.desktop
}
