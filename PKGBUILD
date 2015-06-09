# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-broken-sword-directors-cut
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Uncover the identity of a jester assassin. Unlock the legend of the Knights Templar. Unravel a plot as twisted as the catacombs you're about to prowl."
arch=("i686" "x86_64")
url="http://www.gog.com/game/broken_sword_directors_cut"
license=("custom")
groups=("games")
source=("local://gog_broken_sword_directors_cut_${pkgver}.tar.gz" "gog-broken-sword-directors-cut")
sha256sums=('ab29e847f81a3e217c34aaa70d68261e7a38e5b67861e4cbf1eea68f85f1b2e1'
            'e2fd1fe6a3592c98d9d276bdcf11cb758102ab5159a47548f1d01bc5575e9d18')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/broken-sword-directors-cut
  cp -r "${srcdir}"/Broken\ Sword\ Directors\ Cut/* "${pkgdir}"/opt/gog/broken-sword-directors-cut
  install -Dm644 "${srcdir}"/Broken\ Sword\ Directors\ Cut/support/gog-broken-sword-directors-cut-primary.desktop "${pkgdir}"/usr/share/applications/gog-broken-sword-directors-cut.desktop
  install -Dm644 "${srcdir}"/Broken\ Sword\ Directors\ Cut/support/gog-broken-sword-directors-cut.png "${pkgdir}"/usr/share/pixmaps/gog-broken-sword-directors-cut.png
  install -Dm644 "${srcdir}"/Broken\ Sword\ Directors\ Cut/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-broken-sword-directors-cut" "${pkgdir}/usr/bin/gog-broken-sword-directors-cut"
}
