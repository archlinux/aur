# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-akalabeth-world-of-doom
pkgver=1.0.0.2
pkgrel=1
pkgdesc="Developed in 1979, Akalabeth is the first game made by the legendary creator of the Ultima Series, Richard Garriot."
arch=("i686" "x86_64")
url="http://www.gog.com/game/akalabeth_world_of_doom"
license=("custom")
groups=("games")
source=("local://gog_akalabeth_world_of_doom_${pkgver}.tar.gz" "gog-akalabeth-world-of-doom")
sha256sums=('5b8537028f5eee21948fdaf48eb7c6d03df03762350ef2058469bdc9003d2536'
            '82a7e41037840fdecefcc35633ec7422a68fa2b21be606359f7afd2f90b995fd')
depends=(libpng12 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar 

package() {
  mkdir -p "${pkgdir}"/opt/gog/akalabeth-world-of-doom
  cp -r "${srcdir}"/Akalabeth\ -\ World\ of\ Doom/* "${pkgdir}"/opt/gog/akalabeth-world-of-doom
  install -Dm644 "${srcdir}"/Akalabeth\ -\ World\ of\ Doom/support/gog-akalabeth-world-of-doom-primary.desktop "${pkgdir}"/usr/share/applications/gog-akalabeth-world-of-doom.desktop
  install -Dm644 "${srcdir}"/Akalabeth\ -\ World\ of\ Doom/support/gog-akalabeth-world-of-doom.png "${pkgdir}"/usr/share/pixmaps/gog-akalabeth-world-of-doom.png
  install -Dm644 "${srcdir}"/Akalabeth\ -\ World\ of\ Doom/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-akalabeth-world-of-doom" "${pkgdir}/usr/bin/gog-akalabeth-world-of-doom"
}

