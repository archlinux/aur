
# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname='tauon-music-box'
pkgdesc='A modern streamlined music player'
url="https://github.com/taiko2k/tauonmb"
gitname='TauonMusicBox'
arch=('any')
license=('GPL3')

pkgver=6.1.2
pkgrel=1

depends=('python3' 'noto-fonts' 'noto-fonts-extra' 'sdl2_image' 'python-pillow' 'python-pylast' 'python-gobject' 'xdg-utils' 'python-beautifulsoup4' 'python-requests' 'python-cairo' 'python-flask' 'python-setproctitle' 'flac' 'python-musicbrainzngs' 'alsa-plugins' 'gstreamer' 'gst-plugins-base' 'python-dbus' 'python-oauthlib' 'python-six' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'noto-fonts-cjk' 'python-discogs-client' 'python-hsaudiotag3k' 'python-pylyrics' 'python-pypresence' 'python-send2trash' 'python-stagger' 'python-pysdl2')

optdepends=('ffmpeg: File transcoding' 'p7zip: 7z archive extraction support' 'unrar: RAR archive extraction support' 'python-plexapi: PLEX streaming' 'python-tekore: Spotify playback control' 'picard: Tag editing')

source=("git+https://github.com/Taiko2k/TauonMusicBox.git#tag=v$pkgver" "https://files.pythonhosted.org/packages/1e/d3/1491ad4be5f67d89ad83c9fd751f5d6b83d052c1a8ddd994f37ae37b0d9d/isounidecode-0.3.tar.gz")

sha256sums=("SKIP" "4db0a962c6341826c9a69acaabc2f923a5b124d53a335be892ef29173bc31c5b")



build() {
    cd $gitname
    python compile-translations.py
}

package() {

  install -dm755 "$pkgdir/opt/$pkgname/isounidecode"
  cp -r "$srcdir/isounidecode-0.3/isounidecode/." "$pkgdir/opt/$pkgname/isounidecode" 
  cp -r "$srcdir/$gitname/." "$pkgdir/opt/$pkgname"
  install -D -m755 "$srcdir/$gitname/extra/tauonmb.desktop" "$pkgdir/usr/share/applications/tauonmb.desktop"
  install -D -m755 "$srcdir/$gitname/extra/tauonmb-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb-symbolic.svg"
  install -D -m755 "$srcdir/$gitname/extra/tauonmb.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb.svg"
  install -D -m755 "$srcdir/$gitname/extra/tauonmb.sh" "$pkgdir/opt/$pkgname/tauonmb.sh"
  install -D -m755 "$srcdir/$gitname/extra/tauonmb.sh" "$pkgdir/usr/bin/tauon"
  }

