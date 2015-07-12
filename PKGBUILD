# $Id$
# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: J. Luck <jluck@udel.edu>
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/nixnote/PKGBUILD

pkgname=nixnote
pkgver=1.6
_pkgver='NixNote%201.6'
pkgrel=1
pkgdesc="Formerly called nevernote, nixnote is a clone of Evernote designed to run on Linux."
url="http://www.sourceforge.net/projects/nevernote/"
arch=('x86_64' 'i686')
_arch='amd64'
license=('GPL')
depends=(
	'java-runtime'
	'libpng12'
)
sha256sums=('781f8b9cbe3e1137b62d4dbb76670b3e2d5a20403b04b3767e03a2e89dba860e')

if [ "$CARCH" = 'i686' ]; then
  _arch=i386
  sha256sums=('50be711e33d37fd43590845718e5e5710cc48a5f7f745df8990b0f792da3a7da')
fi;

source="http://sourceforge.net/projects/nevernote/files/${_pkgver}/${pkgname}-${pkgver}_${_arch}.tar.gz/download"

package()
{
	cp -R "$srcdir/nixnote/usr" "$pkgdir/"
	mv "$pkgdir/usr/bin/nixnote.sh" "$pkgdir/usr/bin/nixnote"
}

# vim:set ts= 2 sw=2 Et:

