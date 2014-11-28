# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: rabyte <rabyte__gmail>

pkgname=drascula
pkgver=1.0
pkgrel=5
pkgdesc='"Drascula: The Vampire Strikes Back", classic comical 2D point & click adventure'
arch=('any')
url="http://scummvm.sourceforge.net/"
license=('custom')
depends=('scummvm>=1.0.0')
optdepends=('drascula-audio: audio files'
            'drascula-audio-flac: lossless audio files'
            'drascula-audio-mp3: mp3 audio files')
source=(http://downloads.sourceforge.net/scummvm/$pkgname-$pkgver.zip
        $pkgname.sh)
md5sums=('fe2ee0948159c3acb923c89a1af7cc84'
         '52b843b9acce56eaf8a84ebe83ed0a40')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/$pkgname/
  install -m644 Packet.001 drascula.doc "${pkgdir}"/usr/share/$pkgname/
  install -D -m644 readme.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

  install -D -m755 $pkgname.sh "${pkgdir}"/usr/bin/$pkgname
}
