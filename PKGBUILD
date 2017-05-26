# Maintainer: Blaine Story <theblainestory at gmail com>
pkgname=video-contact-sheet
pkgver=1.13.3
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
backup=('etc/vcs.conf')

source=("http://p.outlyer.net/vcs/files/vcs-${pkgver}.tar.gz")
sha256sums=('d27147dd515588123f78ee536b01f1ec51a2ec422f21473b2b9430a64166e7cc')


package() {
    cd "${srcdir}/vcs-${pkgver}"
    make DESTDIR="${pkgdir}" prefix=/usr install
    install -D examples/vcs.conf.example "${pkgdir}/etc/vcs.conf"
}
