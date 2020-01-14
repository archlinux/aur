# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Patrick Schratz <patrick.schratz@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=impressive
pkgver=0.13.0_beta1a
pkgrel=1
pkgdesc='A simple presentation program that displays slideshows of PDF, image or video files'
arch=('any')
url='http://impressive.sourceforge.net'
license=('GPL2')
depends=('python-pygame' 'python-opengl' 'python-pillow' 'mupdf-tools')
optdepends=('pdftk: for retrieving PDF metadata, can replace mupdf-tools'
            'ghostscript: for alternate PDF rendering'
            'xdg-utils: for starting web or e-mail hyperlinks from PDF documents'
            'mplayer: for sound and video playback'
            'ffmpeg: for more efficient generation of video preview images')
source=(http://downloads.sourceforge.net/${pkgname}/Impressive-${pkgver//_/-}.tar.gz)
sha256sums=('a7f01d7d65b8ad595d8241216e95193c3584af897561c95990116060bd5bbc86')

package() {
  cd "${srcdir}"/Impressive-${pkgver//_/-}

  install -d -m755 "${pkgdir}"/usr/{bin,share/{doc/${pkgname},man/man1}}
  install -m755 ${pkgname}.py "${pkgdir}"/usr/bin/$pkgname
  install -m644 ${pkgname}.html demo.pdf changelog.txt "${pkgdir}"/usr/share/doc/$pkgname/
  install -m644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/
}
