# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=gaupol-git
pkgver=20140621.1947
pkgrel=1
pkgdesc="An editor for text-based subtitles (devel tree)"
arch=('any')
url="http://home.gna.org/gaupol"
license=('GPL')
depends=('python-gobject' 'gtk3' 'gst-plugins-base' 'gst-plugins-good'
         'iso-codes' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'git')
optdepends=('python-pyenchant: spell-checking'
            'gtkspell3: inline spell-checking'
            'python-chardet: character encoding auto-detection'
            'mplayer: subtitle preview'
            'vlc: subtitle preview'
            'gst-plugins-bad: extra media codecs'
            'gst-plugins-ugly: extra media codecs'
            'gst-libav: extra media codecs')
source=('git://github.com/otsaloma/gaupol.git')
sha1sums=('SKIP')
install=gaupol.install

pkgver() {
  cd gaupol
  _d=$(git log -n 1 --pretty=%ad --date=short | sed 's/-//g')
  _c=$(git log --pretty=%h | wc -l)
  printf '%s.%s' $_d $_c
}

package() {
  cd gaupol
  python3 setup.py --without-iso-codes install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
