# $Id$
# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Contributor: YamashitaRen <lemaitre.dulotus@gmail.com>
# Contributor: Sławomir Kowalski <suawekk+aur@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki20-bin
_pkgname=anki
pkgver=2.0.43
pkgrel=3
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('AGPL3')
arch=('i686' 'x86_64')
provides=('anki20' 'anki')
conflicts=('anki20' 'anki')
optdepends=('mplayer: sound playing')
source=("anki")
source_i686=("https://apps.ankiweb.net/downloads/current/${_pkgname}-${pkgver}-i386.tar.bz2")
source_x86_64=("https://apps.ankiweb.net/downloads/current/${_pkgname}-${pkgver}-amd64.tar.bz2")
sha256sums=('fc2316cf2428af18562cc13c6277ff70f8a974f1e7ef32631b8d7f81af60e0c4')
sha256sums_i686=('3afe45798811d71106993d16ae0197fc6772cfacbe329ca599c915b78a14dec2')
sha256sums_x86_64=('8b4174e8c6c5f4ee61c29a7c6270709a959d605ab77588b0f5be3fed216156fa')
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
