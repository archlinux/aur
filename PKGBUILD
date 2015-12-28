# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=bridgedesigner
pkgver=1.15.125
pkgrel=1
pkgdesc="Bridge Design Contest is an Internet-based competition that provides middle school and high school students with a realistic, engaging introduction to engineering"
arch=('any')
url="https://bridgecontest.org/"
license=('GPL')
depends=('java-environment' 'jogl2.2.4')
makedepends=('p7zip')
options=(!strip)
source=("Bridge_Designer_2015_Installation_Image.dmg::http://sourceforge.net/projects/wpbdc/files/Current%20Release/jre/Bridge%20Designer%202105%20Installation%20Image.dmg/download"
        bridgedesigner
        bridgedesigner.desktop
        bridgedesigner.png)
sha1sums=('7c1815f3c21185031c0ec7b6316d3b8283095794'
          '8a419d1b2ba8bda4a39b2df4341b5392ae71f5c1'
          'eddb921bf479f81fe25e9fa4b0ac76895969df06'
          '6d5f09d9b5991e82a534561f918ca489b3c7744c')
noextract=("Bridge_Designer_2015_Installation_Image.dmg")

prepare() {
  7z x "Bridge_Designer_2015_Installation_Image.dmg"
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/{applications,java/bridgedesigner,pixmaps}
  
  install -m755 bridgedesigner $pkgdir/usr/bin/
  install -m644 bridgedesigner.desktop $pkgdir/usr/share/applications/
  install -m644 bridgedesigner.png $pkgdir/usr/share/pixmaps/
  install -m644 "Bridge Designer 2015/Bridge Designer 2015.app/Contents/Java"/AbsoluteLayout.jar $pkgdir/usr/share/java/bridgedesigner/
  install -m644 "Bridge Designer 2015/Bridge Designer 2015.app/Contents/Java"/beansbinding-1.2.1.jar $pkgdir/usr/share/java/bridgedesigner/
  install -m644 "Bridge Designer 2015/Bridge Designer 2015.app/Contents/Java"/bsaf-1.9.1.jar $pkgdir/usr/share/java/bridgedesigner/
  install -m644 "Bridge Designer 2015/Bridge Designer 2015.app/Contents/Java"/jh.jar $pkgdir/usr/share/java/bridgedesigner/
  install -m644 "Bridge Designer 2015/Bridge Designer 2015.app/Contents/Java"/quaqua-filechooser-only.jar $pkgdir/usr/share/java/bridgedesigner/
  install -m644 "Bridge Designer 2015/Bridge Designer 2015.app/Contents/Java"/swing-layout-1.0.4.jar $pkgdir/usr/share/java/bridgedesigner/
  install -m644 "Bridge Designer 2015/Bridge Designer 2015.app/Contents/Java"/WPBD.jar $pkgdir/usr/share/java/bridgedesigner/
}
