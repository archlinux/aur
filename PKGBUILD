# $Id$
# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Contributor: linus.cl <linus.vivaldi@gmail.com>
# Contributor: Stefan Husmann
# Contributor: YamashitaRen <lemaitre.dulotus@yahoo.fr>
# Contributor: Sławomir Kowalski <suawekk+aur@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki20-bin
_pkgname=anki
pkgver=2.0.47
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('AGPL3')
arch=('i686' 'x86_64')
provides=('anki20' 'anki')
conflicts=('anki20' 'anki' 'gstreamer0.10')
depends=('expat' 'glib2' 'sqlite' 'openssl')
optdepends=('mplayer: For playing audio/video on cards'
            'icu48: Enable additional UI languages')
source=("anki")
source_i686=("https://apps.ankiweb.net/downloads/current/${_pkgname}-${pkgver}-i386.tar.bz2")
source_x86_64=("https://apps.ankiweb.net/downloads/current/${_pkgname}-${pkgver}-amd64.tar.bz2")
sha256sums=('fc2316cf2428af18562cc13c6277ff70f8a974f1e7ef32631b8d7f81af60e0c4')
sha256sums_i686=('5f5c440096850d643c97c5ae8697a0c746ad2aa59ef0cb14eae25f1f3ea4741b')
sha256sums_x86_64=('84e3681e659ab7fb50c8f808aafe773759acef7fd9607f3c7900e7ab3667e1de')
options=(!strip)

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  install -d "$pkgdir/opt/$_pkgname"
  cp -r bin/* "$pkgdir/opt/$_pkgname"
  install -Dm 0644 anki.desktop "$pkgdir/usr/share/applications/anki.desktop"
  install -Dm 0644 anki.png "$pkgdir/usr/share/pixmaps/anki.png"
  install -Dm 0644 anki.1 "$pkgdir/usr/share/man/man1/anki.1"

  install -Dm 0755 "$srcdir/anki" "$pkgdir/usr/bin/anki"
}
