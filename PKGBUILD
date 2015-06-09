# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-broken-sword-2-remastered
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Plunge into a shadowy conspiracy world where the schemes of a mad drug kingpin and the prophesied return of an ancient Mayan god clash in what could be the end for all mankind."
arch=("i686" "x86_64")
url="http://www.gog.com/game/broken_sword_2__the_smoking_mirror"
license=("custom")
groups=("games")
source=("local://gog_broken_sword_2_remastered_${pkgver}.tar.gz" "gog-broken-sword-2-remastered")
sha256sums=('f620fc2fcad88243c6febc5a9a82150b6d2a7639d6e490f6bd9af94f3aca4abb'
            '7fa73db2702bb6375a8342efe80446b76ccfd75c0b21c4c60728f118ecf97466')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/broken-sword-2-remastered
  cp -r "${srcdir}"/Broken\ Sword\ 2\ Remastered/* "${pkgdir}"/opt/gog/broken-sword-2-remastered
  install -Dm644 "${srcdir}"/Broken\ Sword\ 2\ Remastered/support/gog-broken-sword-2-remastered-primary.desktop "${pkgdir}"/usr/share/applications/gog-broken-sword-2-remastered.desktop
  install -Dm644 "${srcdir}"/Broken\ Sword\ 2\ Remastered/support/gog-broken-sword-2-remastered.png "${pkgdir}"/usr/share/pixmaps/gog-broken-sword-2-remastered.png
  install -Dm644 "${srcdir}"/Broken\ Sword\ 2\ Remastered/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-broken-sword-2-remastered" "${pkgdir}/usr/bin/gog-broken-sword-2-remastered"
}
