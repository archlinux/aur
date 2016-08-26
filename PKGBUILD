# Contributor: kirigaya <kirigaya@mkacg.com>

pkgbase=gbyzanz
pkgname=gbyzanz
pkgver=20160221
pkgrel=1
pkgdesc="Gbyzanz是GNOME/byzanz的GUI前端，用于简单的屏幕录制。使用qml-material（Google's Material Design.）库开发。支持格式有：gif、flv、ogg、ogv、webm。部分格式支持音频录制。
可以使用鼠标划定区域进行屏幕录制或者直接写入参数控制详细录制。
希望大家在给deepin提交bug过程中，有遇到交互相关的问题能使用gif记录简单的操作过程，以便工程师更快速确定问题和解决问题。
祝大家玩得愉快！:D"
arch=('any')
license=('GPLv3')
url='https://github.com/Match-Yang/Gbyzanz.git'
depends=('qt5-base' 'qml-material')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/Match-Yang/Gbyzanz.git')
md5sums=('SKIP')

pkgver(){
  cd  "$srcdir/$pkgname/"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}
package(){
  cd  "$srcdir/$pkgname/"
  mkdir build
  cd build
  qmake ..
  make
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname/build/gbyzanz" "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname/gbyzanz.desktop" "$pkgdir/usr/share/applications/"
}
