# Maintainer: Blaine Story <theblainestory at gmail com>
pkgname=video-contact-sheet
pkgver=1.13.2
pkgrel=1
pkgdesc="A script to create contact sheets (preview images) from videos."
arch=('i686' 'x86_64')
url="http://p.outlyer.net/vcs/"
license=('LGPL')
depends=('bash' 'ffmpeg' 'imagemagick')
optdepends=(
            'lsdvd: needed for DVD support'
            'perl: needed for DVD support'
            )

source=("http://p.outlyer.net/vcs/files/vcs-${pkgver}.tar.gz")
sha256sums=('fc2a2b3994d5ffb5d87fb3dceaa5f6855aca7a89c58533b12fd11b8fb5b623af')


package() {
  cd "${srcdir}/vcs-${pkgver}"
  make DESTDIR="${pkgdir}" prefix=/usr install
  install -D examples/vcs.conf.example "${pkgdir}/usr/share/doc/vcs/vcs.conf.example"
}
